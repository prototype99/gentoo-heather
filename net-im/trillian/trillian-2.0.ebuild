# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit unpacker

SRC_URI_BASE="https://www.trillian.im/get/linux/${PV}/?deb=64"

DESCRIPTION="Modern instant messaging for home and work that prioritizes chat interoperability and security"
HOMEPAGE="https://www.trillian.im"
SRC_URI="${SRC_URI_BASE} -> ${P}.deb"

#TODO:
#"x86? ( ${SRC_URI_BASE}&arch=i386&revision=${REV} -> ${P}_x86.deb )
#amd64? ( ${SRC_URI_BASE}&arch=x86_64&revision=${REV} -> ${P}_amd64.deb )"
RESTRICT="mirror strip"

#FIXME
LICENSE=""

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/gtk+
	>=dev-libs/libzip-0.10
	>=dev-libs/libunity-7

	>=dev-cpp/gtkmm-bin-3.0.1
	>=dev-cpp/cairomm-bin-1.0
	>=dev-cpp/atkmm-bin-1.6
	>=dev-cpp/pangomm-bin-1.4

	media-libs/libpng:1.2

	dev-libs/libmessaging-menu

	>=dev-cpp/glibmm-2.4"

#emul: =app-emulation/emul-linux-x86-baselibs-20130224

DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	insinto /usr/share
	doins -r "${S}"/usr/share/*
	dosym /usr/share/trillian/trillian /usr/bin/trillian
}

pkg_postinst() {
	chmod 777 /usr/bin/trillian || die
}
