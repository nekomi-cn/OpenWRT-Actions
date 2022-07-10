#!/bin/bash
###
# @Author: iRorikon
# @Date: 2022-07-10 23:50:30
# @FilePath: \OrangePi-R1-Plus-LTS-Lede\script\lede5.10.sh
###
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# fw876/helloworld
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i 's/5.*/5.10/g' target/linux/rockchip/Makefile
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# Lienol/openwrt-package
# sed -i '$a src-git lienol https://github.com/Lancenas/lienol-openwrt-package.git' feeds.conf.default
# sed -i '$a src-git lienol https://github.com/xiaorouji/openwrt-package' feeds.conf.default
