# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit git-r3 distutils

DESCRIPTION="A Python 2.7 byte-code decompiler"
HOMEPAGE="https://github.com/gstarnberger/uncompyle"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gstarnberger/uncompyle.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

