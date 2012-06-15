EAPI=4

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal git-2

DESCRIPTION="Build system library, like Make, but more accurate dependencies."
HOMEPAGE="http://community.haskell.org/~ndm/shake/"
#SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"
EGIT_REPO_URI="git://github.com/Bridgit/cake.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT=test # almost work. fail on Development/Shake/Report.hs

RDEPEND="dev-haskell/binary[profile?]
		>=dev-haskell/deepseq-1.1[profile?] <dev-haskell/deepseq-1.4[profile?]
		>=dev-haskell/hashable-1.1.2.3[profile?] <dev-haskell/hashable-1.2[profile?]
		dev-haskell/random[profile?]
		dev-haskell/time[profile?]
        dev-haskell/glob[profile?]
		>=dev-haskell/transformers-0.2[profile?] <dev-haskell/transformers-0.4[profile?]
		>=dev-haskell/unordered-containers-0.2.1[profile?] <dev-haskell/unordered-containers-0.3[profile?]
		>=dev-lang/ghc-6.10.1"
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
