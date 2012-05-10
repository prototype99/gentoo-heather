inherit git-2
EAPI=2

DESCRIPTION="A very tiny Scheme implementation with decent speed and native hygienic macros."
EGIT_REPO_URI="https://github.com/spurious/chibi-scheme-mirror.git"
HOMEPAGE="http://synthcode.com/scheme/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="boehm-gc"

DEPEND="boehm-gc? ( dev-libs/boehm-gc )"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
