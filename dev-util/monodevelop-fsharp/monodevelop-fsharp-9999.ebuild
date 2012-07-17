# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/fsharp/fsharpbinding.git"

inherit git-2 eutils mono multilib versionator

DESCRIPTION="F# language binding for MonoDevelop"
HOMEPAGE="fsharpbinding"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-lang/fsharp
dev-lang/mono
>=dev-util/monodevelop-2.8.2
dev-dotnet/mono-addins"
RDEPEND="${DEPEND}"

src_configure()
{
	yes | ./configure.sh \
		-e mono \
		-f /usr/lib/fsharp/fsc.exe \
		-c /usr/bin/gmcs
}

src_compile() {
	emake
}

src_install()
{
	dodoc README
	dodir /usr/lib/monodevelop/AddIns/BackendBindings/
	insinto /usr/lib/monodevelop/AddIns/BackendBindings/
	doins bin/FSharpBinding.*
	mono_multilib_comply
}
