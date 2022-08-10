#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# Change Default Theme
sed -i 's/Bootstrap theme/Argon theme/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
rm -rf feeds/luci/themes/luci-theme-argon/
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon/

wget --no-check-certificate -O package/boot/uboot-rockchip/Makefile https://raw.githubusercontent.com/coolsnowwolf/lede/53686de196c0827aac3a337a4751b0353f289fcc/package/boot/uboot-rockchip/Makefile
wget --no-check-certificate -O package/boot/uboot-rockchip/patches/103-tools-disable-TOOLS_LIBCRYPTO.patch https://raw.githubusercontent.com/coolsnowwolf/lede/53686de196c0827aac3a337a4751b0353f289fcc/package/boot/uboot-rockchip/patches/103-tools-disable-TOOLS_LIBCRYPTO.patch
wget --no-check-certificate -O package/boot/uboot-rockchip/patches/201-scripts-remove-dependency-on-swig.patch https://raw.githubusercontent.com/coolsnowwolf/lede/53686de196c0827aac3a337a4751b0353f289fcc/package/boot/uboot-rockchip/patches/201-scripts-remove-dependency-on-swig.patch
wget --no-check-certificate -O package/boot/uboot-rockchip/patches/202-spl-remove-dtoc-of-pdata-generation.patch https://raw.githubusercontent.com/coolsnowwolf/lede/53686de196c0827aac3a337a4751b0353f289fcc/package/boot/uboot-rockchip/patches/202-spl-remove-dtoc-of-pdata-generation.patch
mkdir -p package/boot/uboot-rockchip/src/of-platdata/orangepi-r1-plus-lts-rk3328
wget --no-check-certificate -O package/boot/uboot-rockchip/src/of-platdata/orangepi-r1-plus-lts-rk3328/dt-decl.h https://raw.githubusercontent.com/coolsnowwolf/lede/53686de196c0827aac3a337a4751b0353f289fcc/package/boot/uboot-rockchip/src/of-platdata/orangepi-r1-plus-lts-rk3328/dt-decl.h
wget --no-check-certificate -O package/boot/uboot-rockchip/src/of-platdata/orangepi-r1-plus-lts-rk3328/dt-plat.c https://raw.githubusercontent.com/coolsnowwolf/lede/53686de196c0827aac3a337a4751b0353f289fcc/package/boot/uboot-rockchip/src/of-platdata/orangepi-r1-plus-lts-rk3328/dt-plat.c
wget --no-check-certificate -O package/boot/uboot-rockchip/src/of-platdata/orangepi-r1-plus-lts-rk3328/dt-structs-gen.h https://raw.githubusercontent.com/coolsnowwolf/lede/53686de196c0827aac3a337a4751b0353f289fcc/package/boot/uboot-rockchip/src/of-platdata/orangepi-r1-plus-lts-rk3328/dt-structs-gen.h