# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="2"

inherit git-2 autotools eutils toolchain-funcs multilib elisp-common

DESCRIPTION="Shared library implementing a Lisp dialect"
HOMEPAGE="http://git.tuxfamily.org/librep/main.git"
EGIT_REPO_URI="git://git.tuxfamily.org/gitroot/librep/main.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
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
}

src_prepare() {
#	cd "${S}"
	epatch "${FILESDIR}"/${PN}-disable-elisp.patch
}

src_configure() {
	eautoreconf || die "eautoreconf failed"
	econf \
		--prefix=/usr \
		$(use_with gmp) \
		$(use_with libffi ffi) \
		$(use_with readline) || die "configure failed"
}

src_compile() {
	emake || die "make failed"
	if use emacs; then
		elisp-compile rep-debugger.el || die "elisp-compile failed"
	fi
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc ChangeLog INSTALL MAINTAINERS README TODO
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
