# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI=4

inherit bash-completion-r1 eutils cmake-utils git-2

JS_P=js-1.8.0-rc1

DESCRIPTION="A modern and featureful DVCS (distributed version control system)"
HOMEPAGE="http://veracity-scm.com/"

EGIT_REPO_URI="git://github.com/Cynede/veracity.git"

SRC_URI="ftp://ftp.mozilla.org/pub/mozilla.org/js/${JS_P}.tar.gz
http://ftp.mozilla.org/pub/mozilla.org/js/${JS_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="test"

S=${WORKDIR}/${PN}

RESTRICT=test

RDEPEND="
	dev-libs/icu[static-libs]
	net-misc/curl
	dev-libs/nspr
	sys-apps/util-linux
	dev-db/sqlite:3
	sys-libs/zlib"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	test? ( app-arch/unzip )"

src_configure() {
	# Convince cmake scripts that spidermonkey has been prepared.
	mkdir -p thirdparty/{include/spidermonkey,lib} || die

	local mycmakeargs=(
		-DVVTHIRDPARTY="${S}"/thirdparty
		-DSPIDERMONKEY_INCDIR="${S}"/thirdparty/include
		-DSPIDERMONKEY_LIB="${S}"/thirdparty/lib/libjs.a
	)
	cmake-utils_src_configure
}

src_compile() {
	einfo "Compiling embedded spidermonkey (${JS_P})."
	# Based on thirdparty/build_linux.sh.
	emake -j1 \
		-C "${WORKDIR}"/js/src \
		JS_DIST="${EPREFIX}"/usr \
		JS_THREADSAFE=1 \
		BUILD_OPT=1 \
		-f Makefile.ref
	cp "${WORKDIR}"/js/src/{*.{h,msg,tbl},Linux_All_OPT.OBJ/*.h} thirdparty/include/spidermonkey/ \
		|| die "Preparing embedded spidermonkey."
	cp "${WORKDIR}"/js/src/Linux_All_OPT.OBJ/libjs.a thirdparty/lib/ \
		|| die "Preparing embedded spidermonkey."

	einfo "sed Werror"
	sed -e 's@ -Werror@@' -i "${S}/common-CMakeLists.txt"

	einfo "Compiling ${P}."
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install

	rm -f "${D}"/etc/bash-completion.d || die
	newbashcomp src/cmd/vv.bash_completion vv
}
