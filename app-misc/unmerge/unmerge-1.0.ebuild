# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
inherit eutils

DESCRIPTION="emerge -C"
HOMEPAGE="https://github.com/Heather"
LICENSE="GPL-2"
KEYWORDS="*"
SLOT="0"
S=$WORKDIR
RDEPEND="sys-apps/portage"

src_install() {
	make_wrapper unmerge  'emerge -C "$@"'
}
