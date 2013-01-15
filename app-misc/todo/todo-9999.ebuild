# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit mercurial

DESCRIPTION="AWESOME TODO LIST"
EHG_REPO_URI="https://bitbucket.org/Cynede/ctodo"
HOMEPAGE="https://bitbucket.org/Cynede/ctodo"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="static-libs"

DEPEND="sys-devel/gcc
	dev-db/sqlite"
RDEPEND="${DEPEND}"

src_install() {
	if use static-libs; then
		dolib.a todo.a
	fi
	emake DESTDIR="${D}" install || die "Install failed"
}
