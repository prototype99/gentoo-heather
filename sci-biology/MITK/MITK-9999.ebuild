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
IUSE="+boost"

DEPEND="boost? ( dev-libs/boost )
	dev-qt/qtcore:4
	dev-qt/qtgui:4[-egl]
	dev-qt/qtwebkit:4
	dev-qt/qttest:4
	dev-qt/designer:4
	dev-qt/linguist:4
	dev-qt/qtsql:4
	dev-qt/qtsvg:4
	dev-qt/qthelp:4
	dev-qt/qtopengl:4[-egl]
	sci-libs/vtk[boost?]
	sci-libs/itk"
RDEPEND="${DEPEND}"

CMAKE_MIN_VERSION=2.8.9

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build boost MITK_USE_BOOST)
		$(cmake-utils_use_build boost MITK_USE_SYSTEM_Boost)
	)
	cmake-utils_configure
}

