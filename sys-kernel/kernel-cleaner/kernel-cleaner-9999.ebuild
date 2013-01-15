# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="Disigned for remove broken kernels from /boot and source_dirs/modules_dirs"
HOMEPAGE="https://github.com/megabaks/kernel-cleaner"
EGIT_REPO_URI="git://github.com/megabaks/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-shells/bash
		sys-apps/gawk"
RDEPEND="${DEPEND}
		sys-process/parallel"

src_install(){
	dosbin kernel-cleaner
	insinto /etc
	doins kernel-cleaner.conf
}
