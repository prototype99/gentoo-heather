# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-r3 cmake-utils eutils

DESCRIPTION="The Medical Imaging Interaction Toolkit."
EGIT_REPO_URI="git://github.com/MITK/MITK.git"
HOMEPAGE="http://www.mitk.org/wiki"

LICENSE="BSD"
SLOT="1"
KEYWORDS=""
IUSE="+boost"

DEPEND="boost? ( >=dev-libs/boost-1.58 )
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwebkit:5
	dev-qt/qtwebengine:5[widgets]
	dev-qt/qttest:5
	dev-qt/designer:5
	dev-qt/linguist:5
	dev-qt/qtsql:5
	dev-qt/qtsvg:5
	dev-qt/qthelp:5
	dev-qt/qtxmlpatterns:5
	dev-qt/qtopengl:5"
RDEPEND="${DEPEND}"

CMAKE_MIN_VERSION=3.1

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build boost MITK_USE_BOOST)
		$(cmake-utils_use_build boost MITK_USE_SYSTEM_Boost)
	)
	cmake-utils_src_configure
}

src_compile() {
	:: #cmake-utils_src_compile
}

src_install() {
	:: #cmake-utils_src_install
}
