# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mount-boot

DESCRIPTION="XNSYSTEMS Kernel"
HOMEPAGE="https://github.com/wh0Hoo/xn-repository"
SRC_URI="https://github.com/wh0Hoo/xn-repository/blob/master/kernel/xnimage-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

pkg_preinst() {
	# Make sure /boot is available if needed.
	use initramfs && mount-boot_pkg_preinst
}

pkg_postinst() {
	# Don't forget to umount /boot if it was previously mounted by us.
	use initramfs && mount-boot_pkg_postinst
}

src_install() {
	insinto /lib/modules
	doins -r modules/*

	insinto /boot
	doins boot/*.img
}
