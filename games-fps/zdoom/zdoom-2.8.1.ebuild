# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit cmake-utils eutils versionator unpacker

DESCRIPTION="ZDoom is an enhanced port of the official DOOM source code"
HOMEPAGE="http://www.zdoom.org"
SRC_URI="http://www.zdoom.org/files/${PN}/$(get_version_component_range 1-2)/${P}-src.7z"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cpu_flags_x86_mmx +gtk"

RDEPEND="app-arch/bzip2
	app-arch/p7zip
	media-libs/fmod:1
	media-sound/fluidsynth
	sys-libs/zlib
	virtual/jpeg:0
	x11-libs/libXcursor
	media-libs/libsdl2
	gtk? ( x11-libs/gtk+:2 )"
DEPEND="${RDEPEND}
	cpu_flags_x86_mmx? ( || ( dev-lang/nasm dev-lang/yasm ) )"

S="${WORKDIR}"

src_prepare() {
	# Add new versions of FMOD
	sed -i \
		-e "s:\(set( MAJOR_VERSIONS\):\1 \"40\" \"38\":" \
		src/CMakeLists.txt || die
	# Use default game data path
	sed -i \
		-e "s:/usr/local/share/:/usr/share/games/doom-data/:" \
		src/posix/i_system.h || die "sed i_system.h failed"
	sed -i \
		-e "s:/usr/share/games/doom:/usr/share/games/doom-data/:" \
		src/gameconfigfile.cpp || die "sed gameconfigfile.cpp failed"
	default
}

src_configure() {
	mycmakeargs=(
		-DFMOD_LOCAL_LIB_DIRS="/opt/fmodex/api/lib"
		-DFMOD_INCLUDE_DIR="/opt/fmodex/api/inc"
		-DNO_GTK="$(usex gtk)"
		-DNO_ASM="$(usex cpu_flags_x86_mmx)"
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	dobin "${CMAKE_BUILD_DIR}/${PN}"
	insinto "/usr/share/games/doom-data"
	doins "${CMAKE_BUILD_DIR}/${PN}.pk3"
	dodoc docs/commands.txt
	dohtml docs/console.{css,html}
}

pkg_postinst() {
	echo
	elog "Copy or link wad files into /usr/share/games/doom-data/"
	elog "(the files must be readable by the 'games' group)."
	elog
	elog "To play, simply run:"
	elog
	elog "   zdoom"
	echo
}
