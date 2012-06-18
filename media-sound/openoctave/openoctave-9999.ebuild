# Copyright 1999-20112Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:$

inherit cmake-utils eutils git-2

DESCRIPTION="OpenOctave MIDI sequencer"
HOMEPAGE="http://www.openoctave.org"
SRC_URI=""

EGIT_REPO_URI="git://68.150.160.199:9418/var/git/openoctave.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	>=media-libs/ladspa-sdk-1.0
	>=media-libs/ladspa-cmt-1.14
	|| ( x11-libs/libX11 virtual/x11 )
	>=media-libs/liblrdf-0.3
	>=sci-libs/fftw-3.0.0
	>=media-libs/liblo-0.7
	x11-libs/libXtst"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.15
	>=dev-util/cmake-2.4.2"

S="${WORKDIR}/${PN}"

src_unpack() {
	git_src_unpack
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	cd "${S}"
	dodoc AUTHORS README TRANSLATORS
}
