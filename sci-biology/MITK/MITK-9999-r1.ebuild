# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-2 cmake-utils

DESCRIPTION="The Medical Imaging Interaction Toolkit."
EGIT_REPO_URI="git://github.com/MITK/MITK.git"
HOMEPAGE="http://www.mitk.org/wiki"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qtwebkit
	dev-qt/qttest
	dev-qt/designer
	dev-qt/linguist
	dev-qt/qtsql
	dev-qt/qtsvg
	dev-qt/qthelp
	dev-qt/qtopengl"
RDEPEND="${DEPEND}"

CMAKE_MIN_VERSION=2.8.9

src_install() {
	dodir /usr/share/MITK
	insinto /usr/share/MITK
	doins -r "${BUILD_DIR}"/MITK-build/*
	dosym /usr/share/MITK/bin/usResourceCompiler /usr/bin/usResourceCompiler
	dosym /usr/share/MITK/bin/MitkWorkbench /usr/bin/MitkWorkbench
	dosym /usr/share/MITK/bin/MitkPluginGenerator /usr/bin/MitkPluginGenerator
}

pkg_postinst() {
	chmod 777 /usr/bin/usResourceCompiler || die
	chmod 777 /usr/bin/MitkWorkbench || die
	chmod 777 /usr/bin/MitkPluginGenerator || die
}
