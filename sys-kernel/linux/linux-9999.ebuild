# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from weirdo overlay $

EAPI="5"

COMPRESSTYPE=".lzma"
K_PREPATCHED="yes"
UNIPATCH_STRICTORDER="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE=0
IUSE=""

CKV='3.99'

ETYPE="sources"
EGIT_REPO_URI="git://github.com/torvalds/linux.git"

inherit kernel-2 git-2
detect_version

K_NOSETEXTRAVERSION="don't_set_it"
DESCRIPTION="Kernel Live Sources"
HOMEPAGE="http://github.com/torvalds/linux"
KEYWORDS=""
K_EXTRAEINFO="GNU/Linux kernel"

pkg_setup(){
	kernel-2_pkg_setup
}
