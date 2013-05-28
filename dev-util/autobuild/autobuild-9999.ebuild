# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

EHG_REPO_URI="https://bitbucket.org/lindenlab/autobuild"

PYTHON_MULTIPLE_ABIS="true"
SUPPORT_PYTHON_ABIS="true"

# Python 2.6+ and compliant implementations.
PYTHON_COMPAT=( python{2_6,2_7} pypy{1_9,2_0} )

inherit mercurial multilib python-r1

DESCRIPTION="Linden autobuild"
HOMEPAGE="http://hg.secondlife.com/autobuild"
SRC_URI=""

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

install_into_site_packages() {
insinto $(python_get_sitedir)
cd "${S}"
doins -r autobuild
}

src_install() {
	python_execute_function install_into_site_packages
	dobin bin/autobuild
	dobin bin/llbuild
	dobin bin/llconfigure
}

src_compile() {
	return
}
