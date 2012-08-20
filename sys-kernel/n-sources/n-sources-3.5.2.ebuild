# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/pf-sources/pf-sources-3.5.1.ebuild,v 1.1 2012/08/05 18:46:09 hwoarang Exp $

EAPI="2"

inherit versionator

COMPRESSTYPE=".bz2"
K_USEPV="yes"
UNIPATCH_STRICTORDER="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="0"

CKV="$(get_version_component_range 1-2)"
ETYPE="sources"
inherit kernel-2
detect_version
K_NOSETEXTRAVERSION="don't_set_it"
#K_WANT_GENPATCHES="base"
#K_GENPATCHES_VER="1"

DESCRIPTION="Kernel sources (kernel series ${KV_MAJOR}.${KV_MINOR})"
HOMEPAGE="http://www.gentoo.org"

PF_FILE="patch-${PV}-pf${COMPRESSTYPE}"
PF_URI="http://pf.natalenko.name/sources/$(get_version_component_range 1-2)/${PF_FILE}"

#Disabled set:
#${HGPV_URI} \
#${GENPATCHES_URI} \
#${ARCH_URI}
SRC_URI="${KERNEL_URI} ${PF_URI}"

KEYWORDS="-* ~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

KV_FULL="${PVR}-pf"
S="${WORKDIR}"/linux-"${KV_FULL}"

#${FILESDIR}/4400_logo_larry_the_cow.patch
pkg_setup(){
	UNIPATCH_LIST="${UNIPATCH_LIST}\
	https://raw.github.com/nCdy/Larry/master/logo_larry_the_cow.patch"
	kernel-2_pkg_setup
}

src_prepare(){
	epatch "${DISTDIR}"/"${PF_FILE}"
}

pkg_postinst() {
	kernel-2_pkg_postinst
	local GRADM_COMPAT="sys-apps/gradm-2.9.1"
}
