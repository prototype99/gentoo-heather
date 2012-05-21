# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

WANT_AUTOMAKE="latest"
WANT_AUTOCONF="latest"

SITEFILE=50sawfish-gentoo.el

inherit autotools elisp-common eutils git-2 libtool

IUSE="debug emacs gnome kde nls pango"

DESCRIPTION="Extensible window manager using a Lisp-based scripting language"
HOMEPAGE="http://sawfish.wikia.com"
EGIT_REPO_URI="git://github.com/Nengraphy/Sawfish.git"
#git://git.tuxfamily.org/gitroot/sawfish/main.git"

SLOT="0"
LICENSE="GPL-2 Artistic-2"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc x86"


RDEPEND="nls? ( sys-devel/gettext )
	pango? ( >=x11-libs/pango-1.24.2 )"

DEPEND="${RDEPEND}
	emacs? ( !app-emacs/sawfish )
	>=dev-libs/librep-9999
	>=x11-libs/rep-gtk-9999
	>=dev-util/pkgconfig-0.22
    >=x11-libs/libXinerama-1.1.1"

src_unpack() {
	git-2_src_unpack
	cd "${S}"
	eautoreconf || die "eautoreconf failed"
}

src_compile() {
	cd ${S}
	use debug && sed -i -e 's:\/\* #define DEBUG 1 \*\/:#define DEBUG 1:' src/sawfish.h
	
	set -- \
		--prefix=/usr \
		--with-gdk-pixbuf
		
    if ! use gnome; then
        set -- "$@" --without-gnome2session
    fi
	
    if ! use kde; then
        set -- "$@" --without-kde4session
    fi
	
    if ! use nls; then
        # Use a space because configure script reads --enable-linguas="" as
        # "install everything"
        # Don't use --disable-linguas, because that means --enable-linguas="no",
        # which means "install Norwegian translations"
        set -- "$@" --enable-linguas=" "
    elif [[ "${LINGUAS+set}" == "set" ]]; then
        strip-linguas -i po
        set -- "$@" --enable-linguas="${LINGUAS}"
    else
        set -- "$@" --enable-linguas=""
    fi

	if ! use pango; then
		set -- "$@" --without-pango
	fi

	econf "$@" || die "configure failed"
	emake || die "make failed"

	if use emacs; then
		elisp-compile sawfish.el || die "elisp-compile failed"
	fi
}

src_install() {
	make DESTDIR=${D} install || die "make install failed"
	dodoc AUTHORS ChangeLog* CONTRIBUTING COPYING* INSTALL KEYBINDINGS MAINTAINERS OPTIONS README* TODO
	newdoc OPTIONS sawfishrc

	if use emacs; then
		elisp-install ${PN} sawfish.{el,elc} || die "elisp-install failed."
		elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	fi
}

pkg_postinst() {
	use emacs && elisp-site-regen

	einfo
	einfo "If some animators in sawfish not work correctly"
	einfo "rebuild dev-libs/librep-git with useflag gmp"
	einfo
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
