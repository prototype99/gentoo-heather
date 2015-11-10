# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Replacement for the libndofdev library used by the Second Life"
HOMEPAGE="https://github.com/janoc/libndofdev"
EGIT_REPO_URI="https://github.com/Heather/libndofdev.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="media-libs/libsdl"
DEPEND="${RDEPEND}"

src_install() {
	dolib.a libndofdev.a
	insinto usr/include
	doins ndofdev_external.h
}
