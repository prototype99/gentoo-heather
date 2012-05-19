# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

WANT_AUTOMAKE="latest"
WANT_AUTOCONF="latest"

inherit git-2 autotools eutils libtool toolchain-funcs multilib elisp-common

DESCRIPTION="Shared library implementing a Lisp dialect"
HOMEPAGE="http://git.tuxfamily.org/librep/main.git"
EGIT_REPO_URI="git://github.com/Sholy/rep.git"
#git://git.tuxfamily.org/gitroot/librep/main.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc x86"
IUSE="emacs gmp libffi readline"

RDEPEND=">=sys-libs/gdbm-1.8.3
	emacs? ( virtual/emacs )
	readline? ( sys-libs/readline )
	gmp? ( dev-libs/gmp )
	libffi? ( virtual/libffi )
	!dev-libs/librep
	!dev-libs/librep-svn"

DEPEND="${RDEPEND}
	sys-apps/texinfo"

src_unpack() {
	git-2_src_unpack
	cd "${S}"
	epatch "${FILESDIR}"/${PN}-disable-elisp.patch
	eautoreconf || die "eautoreconf failed"
}

src_compile() {

	econf \
		--prefix=/usr \
		$(use_with gmp) \
		$(use_with libffi ffi) \
		$(use_with readline) || die "configure failed"

	emake || die "make failed"

	if use emacs; then
		elisp-compile rep-debugger.el || die "elisp-compile failed"
	fi

}

src_install() {

	make DESTDIR="${D}" install || die "make install failed"

	dodoc COPYING ChangeLog INSTALL MAINTAINERS README TODO
	docinto doc
	dodoc doc/*

	if use emacs; then
		elisp-install ${PN} rep-debugger.{el,elc} || die "elisp-install failed"
		elisp-site-file-install "${FILESDIR}/50${PN}-gentoo.el" \
			|| die "elisp-site-file-install failed"
	fi

}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
