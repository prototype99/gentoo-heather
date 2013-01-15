# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

EHG_REPO_URI="https://bitbucket.org/lindenlab/autobuild"

PYTHON_MULTIPLE_ABIS="true"
SUPPORT_PYTHON_ABIS="true"
inherit mercurial multilib python

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
