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
	dev-qt/qtcore
	dev-qt/qtgui[-egl]
	dev-qt/qtwebkit
	dev-qt/qttest
	dev-qt/designer
	dev-qt/linguist
	dev-qt/qtsql
	dev-qt/qtsvg
	dev-qt/qthelp
	dev-qt/qtopengl[-egl]
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
