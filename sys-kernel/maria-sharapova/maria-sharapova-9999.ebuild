# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from nCdy overlay $

EAPI="4"

COMPRESSTYPE=".lzma"
K_PREPATCHED="yes"
UNIPATCH_STRICTORDER="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE=0
IUSE="+nCdy"

CKV='3.99'

ETYPE="sources"
if use nCdy;
then EGIT_REPO_URI="git@github.com:nCdy/maria-sharapova.git"
else EGIT_REPO_URI="git://github.com/nCdy/maria-sharapova.git"
fi

inherit kernel-2 git-2
detect_version

K_NOSETEXTRAVERSION="don't_set_it"
DESCRIPTION="Special Kernel Live Sources for Tennis players"
HOMEPAGE="http://nCdy.org"
KEYWORDS=""
K_EXTRAEINFO="GNU/Linux kernel for Tennis players"

pkg_setup(){
	kernel-2_pkg_setup
}
