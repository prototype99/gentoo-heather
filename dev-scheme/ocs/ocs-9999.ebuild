# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="A very tiny Scheme implementation with decent speed and native hygienic macros."
EGIT_REPO_URI="git://bitbucket.org/Heather/ocs.git"
HOMEPAGE="http://bitbucket.org/Heather/ocs"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/ocaml[ocamlopt]"
RDEPEND="${DEPEND}"
