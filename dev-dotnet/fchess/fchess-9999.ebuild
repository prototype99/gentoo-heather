# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/Cynede/FChess.git"

inherit git-2 fake

DESCRIPTION="FAKE - F# Make"
HOMEPAGE="https://github.com/Cynede/FChess"
SRC_URI=""

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/mono"
RDEPEND="${DEPEND}"

MAKEOPTS="-j1"

src_install() {
	dobin src/bin/Release/FChess.exe || die
}
