# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Syntax highlighting (similar to the fish shell) for ZSH"
HOMEPAGE="https://github.com/zsh-users/zsh-syntax-highlighting"
SRC_URI=""
EGIT_REPO_URI="https://github.com/zsh-users/zsh-syntax-highlighting.git"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=app-shells/zsh-4.3.17"
RDEPEND="${DEPEND}"

src_install() {
	insinto "/usr/share/${PN}"
	doins "${S}/${PN}.plugin.zsh"
	
	emake install DESTDIR="${D}" PREFIX="/usr"
}
