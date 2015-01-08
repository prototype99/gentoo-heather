# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-2 cmake-utils eutils

DESCRIPTION="The Medical Imaging Interaction Toolkit."
EGIT_REPO_URI="git://github.com/MITK/MITK.git"
HOMEPAGE="http://www.mitk.org/wiki"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-qt/qtcore
	dev-qt/qtgui[-egl]
	dev-qt/qtwebkit
	dev-qt/qttest
	dev-qt/designer
	dev-qt/linguist
	dev-qt/qtsql
	dev-qt/qtsvg
	dev-qt/qthelp
	dev-qt/qtopengl[-egl]"
RDEPEND="${DEPEND}"

CMAKE_MIN_VERSION=2.8.9

src_install() {
	dodir /usr/share/MITK
	insinto /usr/share/MITK
	doins -r "${BUILD_DIR}"/*
	#TODO: make some tricks to run it success
	chmod a+x /usr/share/MITK/MITK-build/bin/MitkWorkbench
	make_wrapper MITK "/usr/share/MITK/MITK-build/bin/MitkWorkbench"
}
