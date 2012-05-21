# Distributed under the terms of the GNU General Public License v2
EAPI="2"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="0"
ETYPE="sources"
inherit kernel-2
detect_version
DESCRIPTION="LTS Kernel, I randomly desired to support this one, I will update it when I want to."
HOMEPAGE="http://www.kernel.org"
SRC_URI="${KERNEL_URI}"
KEYWORDS="" #no tar.bz2?