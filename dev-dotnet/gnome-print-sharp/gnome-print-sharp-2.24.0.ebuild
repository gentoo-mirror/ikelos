# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

GTK_SHARP_REQUIRED_VERSION="2.12"
GTK_SHARP_MODULE_DIR="gnomeprint"

inherit gtk-sharp-module

SLOT="2"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="${DEPEND}
	=dev-dotnet/gnome-sharp-${PV}*
	dev-util/pkgconfig
	x11-libs/libwnck"
