EAPI=4
inherit git-2

DESCRIPTION="AWESOME TODO LIST"
EGIT_REPO_URI="git://github.com/Bridgit/todo.git"
HOMEPAGE="http://nengraphy.com"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-db/sqlite"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
