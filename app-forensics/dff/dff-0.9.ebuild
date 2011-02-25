# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.6"

inherit cmake-utils python

DESCRIPTION="A digital forensics framework which aims to analyze and recover any
kind of digital artifact."
HOMEPAGE="http://tracker.digital-forensic.org/"
SRC_URI="http://www.digital-forensic.org/${PN}-src-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="phonon doc ewf"

DEPEND=">=dev-lang/swig-1.3.38
		dev-python/sip
		doc? ( >=dev-python/PyQt4-4.4.0[phonon?,webkit,assistant] )
		!doc? ( >=dev-python/PyQt4-4.4.0[phonon?] )
		>=dev-python/qscintilla-python-2.4
		>=sys-apps/file-4.26[python]
		"
RDEPEND="${DEPEND}
		 ewf? ( >=app-forensics/libewf-20100226 )"

S="${WORKDIR}/${PN}-src-${PV}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-0.9-disable-qtassistant.patch"
}

src_configure() {
	mycmakeargs+=( "-DINSTALL:BOOLEAN=ON" )
	cmake-utils_src_configure
}
