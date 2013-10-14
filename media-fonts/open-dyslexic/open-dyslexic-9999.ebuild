# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit font git-2

DESCRIPTION="new open sourced font created to increase readability for readers with dyslexia"
HOMEPAGE="http://dyslexicfonts.com/"
EGIT_REPO_URI="git://github.com/antijingoist/open-dyslexic.git"

LICENSE="CCPL-Attribution-3.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

DEPEND=""
RDEPEND=""

FONT_SUFFIX="ttf"
S="${WORKDIR}"
FONT_S="${S}/ttf"

FONTDIR=/usr/share/fonts/open-dyslexis

# Only installs fonts
RESTRICT="strip binchecks"

src_install() {
	font_src_install
}
