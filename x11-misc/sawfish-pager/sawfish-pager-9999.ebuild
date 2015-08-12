# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit git-2 autotools

DESCRIPTION="The native pager of the Sawfish windowmanager"
HOMEPAGE="http://sawfish.wikia.com"
EGIT_REPO_URI="git://git.tuxfamily.org/gitroot/sawfishpager/pager.git"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS=""
IUSE=""

DEPEND=">=x11-wm/sawfish-1.6.1"

RDEPEND="${DEPEND}
	!x11-misc/sawfish-pager"

src_unpack() {
	git-2_src_unpack
	cd "${S}"
	eautoreconf || die "eautoreconf failed"
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc INSTALL NEWS README TODO
}

pkg_postinst() {
	einfo
	einfo "To use sawfish-pager add:"
	einfo
	einfo "(require 'sawfish.wm.ext.pager)"
	einfo "(add-hook 'after-initialization-hook pager t)"
	einfo
	einfo "in your ~/.sawfishrc file."
	einfo
}
