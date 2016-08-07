# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-2

DESCRIPTION="AWESOME TODO LIST"
EGIT_REPO_URI="git://github.com/Heather/sync.git"
HOMEPAGE="https://github.com/Heather/sync"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/python:*"
RDEPEND="${DEPEND}"

src_install() {
	newbin "${S}/__main__.py" "forks-sync"
}
