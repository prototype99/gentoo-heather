# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="A very tiny Scheme implementation with decent speed and native hygienic macros."
EGIT_REPO_URI="git://bitbucket.org/Cynede/ocs.git"
HOMEPAGE="http://bitbucket.org/Cynede/ocs"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/ocaml[ocamlopt]"
RDEPEND="${DEPEND}"
