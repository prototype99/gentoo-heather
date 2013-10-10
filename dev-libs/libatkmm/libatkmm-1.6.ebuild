# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit unpacker

SRC_URI_BASE="http://ubuntu.mirror.cambrium.nl/ubuntu//pool/main/a/atkmm1.6/libatkmm-1.6-1_2.22.6-1ubuntu1"

DESCRIPTION="libatkmm"
HOMEPAGE=""
SRC_URI="	x86? ( ${SRC_URI_BASE}_i386.deb -> ${P}_x86.deb )
		amd64? ( ${SRC_URI_BASE}_amd64.deb -> ${P}_amd64.deb )"
RESTRICT="mirror strip"

#FIXME
LICENSE=""

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/glib-2.16"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	if [[ "${ARCH}" == "x86" ]] ; then
		dolib "${S}/usr/lib/i386-linux-gnu/libatkmm-1.6.so.1"
		dolib "${S}/usr/lib/i386-linux-gnu/libatkmm-1.6.so.1.1.0"
	else
		dolib "${S}/usr/lib/x86_64-linux-gnu/libatkmm-1.6.so.1"
		dolib "${S}/usr/lib/x86_64-linux-gnu/libatkmm-1.6.so.1.1.0"
	fi
}

