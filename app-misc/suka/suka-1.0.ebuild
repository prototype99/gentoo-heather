# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
inherit eutils

DESCRIPTION="suka"
HOMEPAGE="https://github.com/Heather"
LICENSE="GPL-2"
KEYWORDS="*"
SLOT="0"
S=$WORKDIR
RDEPEND="app-admin/sudo"

src_install() {
	make_wrapper suka 'sudo "$@"'
}
