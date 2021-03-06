# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit git-r3 cmake-utils

DESCRIPTION="Python compiled-bytecode disassembler and decompiler"
HOMEPAGE="https://github.com/zrax/pycdc"
SRC_URI=""

EGIT_REPO_URI="https://github.com/zrax/pycdc"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
