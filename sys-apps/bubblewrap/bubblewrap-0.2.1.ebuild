# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils autotools

DESCRIPTION="Unprivileged sandboxing tool, namespaces-powered chroot-like solution"
HOMEPAGE="https://github.com/projectatomic/bubblewrap"
SRC_URI="https://github.com/projectatomic/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="caps selinux"

DEPEND="sys-libs/libseccomp"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	local myconf
    if ! use selinux; then myconf+=" --disable-selinux"; fi
    if use caps; then 
        myconf+=" -with-priv-mode=caps"
    else
        myconf+=" -with-priv-mode=none"
    fi
	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" install
}
