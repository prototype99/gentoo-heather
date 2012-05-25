EAPI=2

inherit git-2

DESCRIPTION="A very tiny Scheme implementation with decent speed and native hygienic macros."
EGIT_REPO_URI="git://github.com/Sholy/ocs.git"
HOMEPAGE="http://will.iki.fi/software/ocs/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-lang/ocaml[ocamlopt]"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
