# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit mercurial

DESCRIPTION="AWESOME TODO LIST"
EHG_REPO_URI="https://bitbucket.org/Ashlyn/ctodo"
HOMEPAGE="https://bitbucket.org/Ashlyn/ctodo"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-devel/gcc
	dev-db/sqlite"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
