# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-2

DESCRIPTION="AWESOME TODO LIST"
EGIT_REPO_URI="git://github.com/Heather/sync.git"
HOMEPAGE="https://github.com/Heather/sync"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

src_install() {
	newbin "${S}/sync.py" "forks-sync"
}
