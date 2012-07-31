# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

CABAL_FEATURES="bootstrap lib profile"
inherit haskell-cabal eutils versionator git-2

MY_PN="Cabal"
MY_PV=$(get_version_component_range '1-3')
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A framework for packaging Haskell software"
HOMEPAGE="http://www.haskell.org/cabal/"
EGIT_REPO_URI="git://github.com/Nensha/cabal.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="doc"

RESTRICT="test" # avoid circular deps

RDEPEND=">=dev-lang/ghc-7"
DEPEND="${DEPEND}
		virtual/pkgconfig"
# cabal uses dev-util/pkgconfig using runtime to resolve C dependencies, so
# repoman's RDEPEND.suspect QA does not apply here

S="${WORKDIR}/${MY_PN}" #-${MY_PV}"

CABAL_CORE_LIB_GHC_PV="7.5.*"

src_prepare() {
	cp -rf "${S}/Cabal" "${WORKDIR}" || die
}

src_configure() {
	if ! cabal-is-dummy-lib; then
		einfo "Bootstrapping Cabal..."
		$(ghc-getghc) -i -i. -i"${WORKDIR}/${FP_P}" -cpp --make Setup.hs \
			-o setup || die "compiling Setup.hs failed"
		cabal-configure
	fi
}

src_compile() {
	if ! cabal-is-dummy-lib; then
		cabal-build
	fi
}
