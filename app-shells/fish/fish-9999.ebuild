# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5

inherit base autotools eutils git-2

DESCRIPTION="fish is the Friendly Interactive SHell"
HOMEPAGE="http://fishshell.com/"
EGIT_REPO_URI="git://github.com/fish-shell/fish-shell.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X"

DEPEND="sys-libs/ncurses
	sys-devel/bc
	sys-devel/gettext
	X? ( x11-misc/xsel )"
RDEPEND="${DEPEND}"

src_prepare() {
	base_src_prepare
	eautoreconf
}

src_configure() {
	# Set things up for fish to be a default shell.
	# It has to be in /bin in case /usr is unavailable.
	# Also, all of its utilities have to be in /bin.
	econf docdir="${EPREFIX}"/usr/share/doc/${PF} \
		--without-xsel \
		--bindir="${EPREFIX}"/bin
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
}

pkg_postinst() {
	elog
	elog "To use ${PN} as your default shell, you need to add ${EPREFIX}/bin/${PN}"
	elog "to ${EPREFIX}/etc/shells."
	elog
	ewarn "Many files moved to ${EROOT}usr/share/fish/completions from ${EROOT}etc/fish.d/."
	ewarn "Delete everything in ${EROOT}etc/fish.d/ except fish_interactive.fish."
	ewarn "Otherwise, fish won't notice updates to the installed files,"
	ewarn "because the ones in /etc will override the new ones in /usr."
	echo
}
