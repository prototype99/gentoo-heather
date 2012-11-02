# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit mercurial

DESCRIPTION="AWESOME TODO LIST"
EHG_REPO_URI="https://bitbucket.org/Ashlyn/Sync"
HOMEPAGE="https://bitbucket.org/Ashlyn/Sync"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

src_install() {
	insinto "/etc/conf.d/"
	doins "${S}/repolist.conf"
	newbin "${S}/sync.py" "forks-sync"
}
