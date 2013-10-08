# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit unpacker

SRC_URI_BASE="https://www.trillian.im/get/linux/beta/?deb=1"

DESCRIPTION="Trillian is modern instant messaging for home and work that prioritizes chat interoperability and security."
HOMEPAGE="https://www.trillian.im"
SRC_URI="${SRC_URI_BASE} -> trillian-for-linux-v1.0.0.1-amd64.deb"

#TODO:
#"x86? ( ${SRC_URI_BASE}&arch=i386&revision=${REV} -> ${P}_x86.deb )
#amd64? ( ${SRC_URI_BASE}&arch=x86_64&revision=${REV} -> ${P}_amd64.deb )"
RESTRICT="mirror strip"

#FIXME
LICENSE=""

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/gtk+"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	dodir /usr/share/trillian
	insinto /usr/share/trillian
	doins "${S}"/usr/share/trillian/*
	dodir /usr/share/applications
	insinto /usr/share/applications
	doins "${S}"/usr/share/applications/*
	dodir /usr/share/icons/hicolor/scalable/apps
	insinto /usr/share/icons/hicolor/scalable/apps
	doins "${S}"/usr/share/icons/hicolor/scalable/apps/*
	dodir /usr/share/indicators/messages/applications
	insinto /usr/share/indicators/messages/applications
	doins "${S}"/usr/share/indicators/messages/applications/*
	dodir /usr/share/menu
	insinto /usr/share/menu
	doins "${S}"/usr/share/menu/*
	dobin "${S}"/usr/bin/trillian
}

