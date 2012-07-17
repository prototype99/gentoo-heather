# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="4"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="0"
CKV=`date +%F`
ETYPE="sources"
inherit kernel-2 git-2
detect_version
DESCRIPTION="Linux kernel to build with llvm and clang"
HOMEPAGE="http://www.kernel.org"
EGIT_REPO_URI="http://git.linuxfoundation.org/llvm-setup.git"
EGIT_PROJECT="linux"

#dev-vcs/subversion - used to build clang but... ?
DEPEND="dev-util/cmake
sys-fs/multipath-tools
sys-libs/zlib
sys-devel/clang"
RDEPEND="${DEPEND}"

KEYWORDS=""
IUSE=""
