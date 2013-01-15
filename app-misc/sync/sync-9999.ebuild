# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit mercurial

DESCRIPTION="AWESOME TODO LIST"
EHG_REPO_URI="https://bitbucket.org/Cynede/Sync"
HOMEPAGE="https://bitbucket.org/Cynede/Sync"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

src_install() {
	newbin "${S}/sync.py" "forks-sync"
}
