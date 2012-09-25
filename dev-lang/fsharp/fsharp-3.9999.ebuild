# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/fsharp/fsharp.git"

inherit git-2 autotools mono eutils

DESCRIPTION="The F# 3 Compiler (OpenSource release; GitHub sources)"
HOMEPAGE="https://github.com/nCdy/fsharp"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-lang/mono"
RDEPEND="${DEPEND}"

create_exe_wrappers() {
	ebegin "creating compiler wrappers"

	for exe in fsi fsc; do
		make_wrapper ${exe} "mono /usr/$(get_libdir)/${PN}/${exe}.exe" \
			|| die "couldn't create wrapper for ${exe}.exe"
	done

	eend $?
}

src_install() {
	insinto "/usr/$(get_libdir)/${PN}"
	doins lkg/FSharp-4.0.30319.1/bin* || die "installing libraries failed"

	local libname=lkg/FSharp-4.0.30319.1/bin/FSharp.Core.dll

	egacinstall "${libname}" \
		|| die "couldn't install ${libname} in the global assembly cache"

	create_exe_wrappers
}
