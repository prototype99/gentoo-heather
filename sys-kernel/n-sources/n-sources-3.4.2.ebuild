# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/hardened-sources/hardened-sources-3.4.2.ebuild,v 1.2 2012/06/29 00:11:38 blueness Exp $

EAPI="4"

ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="2"
K_DEBLOB_AVAILABLE="0"

inherit kernel-2
detect_version

PENPATCHES_VER="1"
PENPATCHES="penpatches-${PV}-${PENPATCHES_VER}.tar.xz"
PENPATCHES_URI="http://dev.gentoo.org/~zerochaos/distfiles/${PENPATCHES}"

HGPV="${KV_MAJOR}.${KV_MINOR}.${KV_PATCH}-1"
HGPV_URI="http://dev.gentoo.org/~blueness/hardened-sources/hardened-patches/hardened-patches-${HGPV}.extras.tar.bz2"

SRC_URI="${KERNEL_URI} ${HGPV_URI} ${GENPATCHES_URI} ${ARCH_URI} ${PENPATCHES_URI}"

UNIPATCH_LIST="${DISTDIR}/hardened-patches-${HGPV}.extras.tar.bz2 ${DISTDIR}/${PENPATCHES}"

DESCRIPTION="Hardened kernel sources (kernel series ${KV_MAJOR}.${KV_MINOR})"
HOMEPAGE="http://www.gentoo.org/proj/en/hardened/"
IUSE=""

KEYWORDS="~alpha ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc"

RDEPEND=">=sys-devel/gcc-4.5"

pkg_setup() {
UNIPATCH_EXCLUDE="${UNIPATCH_EXCLUDE} \
44??-grsec* \
4445_disable-compat_vdso.patch \
4420_grsecurity-* \
4310_aufs3.patch \
9999_aufs3-grsec.patch \
4500-new-dect-stack.patch \
4200_fbcondecor-0.9.6.patch"
}

pkg_postinst() {
	kernel-2_pkg_postinst
	local GRADM_COMPAT="sys-apps/gradm-2.9.1"
}
