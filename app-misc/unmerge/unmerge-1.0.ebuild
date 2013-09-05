# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils

DESCRIPTION="emerge -C"
HOMEPAGE="https://github.com/Heather"
LICENSE="GPL-3"
KEYWORDS="*"
SLOT="0"
S=$WORKDIR

src_install() {
	make_wrapper unmerge "emerge -C \"\$@\""
}
