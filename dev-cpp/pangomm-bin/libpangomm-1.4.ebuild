# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit unpacker

SRC_URI_BASE="http://ubuntu.mirror.cambrium.nl/ubuntu//pool/main/p/pangomm/libpangomm-1.4-1_2.26.1-1"

DESCRIPTION="libpangomm"
HOMEPAGE=""
SRC_URI="	x86? ( ${SRC_URI_BASE}_i386.deb -> ${P}_x86.deb )
		amd64? ( ${SRC_URI_BASE}_amd64.deb -> ${P}_amd64.deb )"
RESTRICT="mirror strip"

#FIXME
LICENSE=""

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/glib-2.35"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	dolib "${S}/usr/lib/libpangomm-1.4.so.1"
	dolib "${S}/usr/lib/libpangomm-1.4.so.1.0.30"
}

