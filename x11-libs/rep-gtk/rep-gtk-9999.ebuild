# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

WANT_AUTOMAKE="latest"
WANT_AUTOCONF="latest"

inherit git-2 autotools eutils toolchain-funcs multilib

DESCRIPTION="A GTK+ language binding for the librep Lisp environment"
HOMEPAGE="http://git.tuxfamily.org/?p=gitroot/librep/gtk.git;a=summary"
EGIT_REPO_URI="git://github.com/Nengraphy/rep-gtk.git"
#git://git.tuxfamily.org/gitroot/librep/gtk.git"

LICENSE="GPL-2"
SLOT="gtk-2.0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc x86"
IUSE=""

RDEPEND=">=dev-libs/librep-9999
	>=x11-libs/gtk+-2.10.0
	!x11-libs/rep-gtk
	!x11-libs/rep-gtk-svn"

DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.22"

src_unpack() {
	git-2_src_unpack
	cd "${S}"
	eautoreconf || die "eautoreconf failed"
}

src_compile() {
	econf \
		--prefix=/usr || die "configure failed"
	emake || die "make failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"

	dodoc AUTHORS COPYING ChangeLog INSTALL NEWS README* TODO
	docinto examples
	dodoc examples/*
}
