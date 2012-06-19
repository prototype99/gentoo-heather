# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal git-2

DESCRIPTION="Build system library, like Make, but more accurate dependencies."
HOMEPAGE="http://community.haskell.org/~ndm/shake/"
EGIT_REPO_URI="git://github.com/Nensha/cake.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="test"
RESTRICT=test # almost work. fail on Development/Shake/Report.hs

#	dev-haskell/glob
#	dev-haskell/parallel-io
#	dev-haskell/canonical-filepath
#	dev-haskell/unordered-containers

RDEPEND="dev-haskell/binary
	dev-haskell/deepseq
	dev-haskell/hashable
	dev-haskell/random
	dev-haskell/time
	dev-haskell/transformers
	dev-lang/ghc"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6"

src_configure() {
	cabal_src_configure $(cabal_flag test testprog)
}

src_test() {
	shake_datadir="." dist/build/shake/cake test || die
}

src_install() {
	haskell-cabal_src_install
	use test && rm "${ED}/usr/bin/cake"
}
