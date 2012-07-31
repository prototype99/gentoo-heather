# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit mercurial multilib

EHG_REPO_URI="http://hg.secondlife.com/viewer-release"

DESCRIPTION="Second Life Viewer"
HOMEPAGE="https://bitbucket.org/lindenlab/viewer-release"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-util/autobuild
dev-libs/boost
>=net-misc/curl-7.15.4
dev-libs/openssl
media-libs/freetype
media-libs/mesa
media-libs/libogg
media-libs/fmod
media-libs/openal
sys-libs/db
sys-libs/zlib
x11-libs/pango
media-libs/libpng
media-libs/openjpeg
sys-devel/flex"
RDEPEND=">=net-misc/curl-7.15.4
dev-libs/openssl
media-libs/freetype
media-libs/mesa
media-libs/libogg
media-libs/fmod
media-libs/openal
sys-libs/db
sys-libs/zlib
x11-libs/pango
media-libs/libpng
media-libs/openjpeg"

dir="${GAMES_DATADIR}/${PN}"

pkg_setup() {
	if [ "`gcc-config -c | grep '4.2.0'`" ]; then
		die "Secondlife need gcc < 4.2.0. Use gcc-config to use another version."
	fi
}

src_compile() {
	autobuild build -c Release --verbose
}

src_install() {
	cd "${S}"/build/
	insinto "${dir}"
	doins gridargs.dat
	doins -r fonts || die
	newins licenses-linux.txt licenses.txt || die
	newins linux_tools/client-readme.txt README-linux.txt || die
	newins linux_tools/client-readme-voice.txt README-linux-voice.txt || die
	newins res/ll_icon.png secondlife_icon.png || die

	exeinto "${dir}"
	doexe linux_tools/launch_url.sh || die
	doexe linux_tools/*_secondlifeprotocol.sh || die
	newexe linux_tools/wrapper.sh secondlife || die
	use !nollmozlib && ln -s "/usr/$(get_libdir)/llmozlib2/runtime_release" "${D}/${dir}/app_settings/mozilla-runtime-linux-i686"

	# Pb with certificate check
	insinto "${dir}/app_settings"
	doins "${FILESDIR}/${PV}/settings.xml"

	games_make_wrapper secondlife ./secondlife "${dir}" "/usr/$(get_libdir)/llmozlib2"
	newicon res/ll_icon.png secondlife_icon.png || die
	make_desktop_entry secondlife "Second Life" secondlife_icon.png

	newdoc licenses-linux.txt licenses.txt
	newdoc linux_tools/client-readme.txt README-linux.txt
	newdoc linux_tools/client-readme-voice.txt README-linux-voice.txt
}
