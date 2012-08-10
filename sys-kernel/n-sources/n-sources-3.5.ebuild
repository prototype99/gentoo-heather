# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/hardened-sources/hardened-sources-3.5.ebuild,v 1.2 2012/06/29 00:11:38 blueness Exp $

EAPI="4"

ETYPE="sources"
K_WANT_GENPATCHES="base"
K_GENPATCHES_VER="1"
K_DEBLOB_AVAILABLE="0"

inherit kernel-2
detect_version

SRC_URI=" \
${KERNEL_URI} \
${HGPV_URI} \
${GENPATCHES_URI} \
${ARCH_URI}"

pkg_setup() {
	UNIPATCH_LIST="${UNIPATCH_LIST}\
		${FILESDIR}/4400_logo_larry_the_cow.patch\
		${FILESDIR}/9999_aufs3-grsec.patch"
}

DESCRIPTION="Kernel sources (kernel series ${KV_MAJOR}.${KV_MINOR})"
HOMEPAGE="http://www.gentoo.org"
IUSE=""

KEYWORDS="~alpha ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~amd64 ~x86"

pkg_postinst() {
	kernel-2_pkg_postinst
	local GRADM_COMPAT="sys-apps/gradm-2.9.1"
}
