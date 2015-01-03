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
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwebkit:5
	dev-qt/qttest:5
	dev-qt/designer:5
	dev-qt/linguist:5
	dev-qt/qtsql:5
	dev-qt/qtsvg:5
	dev-qt/qthelp:5
	dev-qt/qtopengl:5"
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
