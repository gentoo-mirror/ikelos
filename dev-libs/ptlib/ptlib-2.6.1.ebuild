# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit gnome2 eutils

DESCRIPTION="Network focused portable C++ class library providing high level functions"
HOMEPAGE="http://www.ekiga.org/"

LICENSE="MPL-1.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="alsa bsdvideo debug doc esd ieee1394 ipv6 ldap minimal noaudio novideo oss
sasl sdl ssl sunaudio v4l v4l2 xml"

RDEPEND="alsa? ( media-libs/alsa-lib )
	esd? ( media-sound/esound )
	ieee1394? ( media-libs/libdv
		sys-libs/libavc1394
		media-libs/libdc1394:1 )
	ldap? ( net-nds/openldap )
	sasl? ( dev-libs/cyrus-sasl:2 )
	sdl? ( media-libs/libsdl )
	ssl? ( dev-libs/openssl )
	xml? ( dev-libs/expat )"
DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex
	v4l? ( sys-kernel/linux-headers )
	v4l2? ( sys-kernel/linux-headers )
	!dev-libs/pwlib"

src_compile() {
	local myconf=""
	local makeopts=""

	use noaudio && myconf="${myconf} --disable-audio"
	use novideo && myconf="${myconf} --disable-video"

	econf \
		${myconf} \
		$(use_enable alsa) \
		$(use_enable bsdvideo) \
		$(use_enable debug exceptions) \
		$(use_enable debug memcheck) \
		$(use_enable esd) \
		$(use_enable ieee1394 avc) \
		$(use_enable ieee1394 dc) \
		$(use_enable ipv6) \
		$(use_enable ldap openldap) \
		$(use_enable minimal minsize) \
		$(use_enable oss) \
		$(use_enable sasl) \
		$(use_enable sdl) \
		$(use_enable ssl openssl) \
		$(use_enable sunaudio) \
		$(use_enable v4l) \
		$(use_enable v4l2) \
		$(use_enable xml expat) \
		--enable-plugins \
		|| die "econf failed"

	if use debug; then
		makeopts="${makeopts} DEBUG=1 debug"
	fi

	emake ${makeopts} || die "emake failed"
}
