# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A mod that attempts to make Doom faster placed, harder, gorier and more violent."
HOMEPAGE="http://www.moddb.com/mods/brutal-doom/"
SRC_URI="http://www.moddb.com/downloads/mirror/95667/113/cf2617048e3641a1d9ee675fd134b7f5 -> brutal${PV}.zip"

LICENSE="HPND"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=games-fps/zdoom-2.7.0"
DEPEND="app-arch/unzip"

S="${WORKDIR}"

src_install() {
	insinto "/usr/share/games/doom-data"
	doins brutalv${PV}b.pk3
	dodoc *.rtf
}

pkg_postinst() {
	doom_pkg_postinst
	echo
	elog "In order to play this mod run zdoom with -file option:"
	elog "    zdoom -file /usr/share/games/doom-data/brutalv${PV}.pk3"
	echo
}
