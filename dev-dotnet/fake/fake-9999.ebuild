# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/Cynede/FAKE.git"
EGIT_MASTER="develop"

inherit git-2

DESCRIPTION="FAKE - F# Make"
HOMEPAGE="https://github.com/Cynede/FAKE"
SRC_URI=""

LICENSE="MS-PL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-lang/mono
dev-lang/fsharp"
RDEPEND="${DEPEND}"

MAKEOPTS="-j1"

src_prepare()
{
	./mono_build.sh
}
