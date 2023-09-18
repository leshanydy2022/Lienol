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
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate
# 设置密码为空
#sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings
# Install theme
#git clone https://github.com/leshanydy2022/luci-theme-bootstrap-mod.git package/lean/luci-theme-bootstrap-mod
# Install app
#rm -rf feeds/luci/applications/luci-app-passwall
#svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall feeds/luci/applications/luci-app-passwall
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/lean/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
git clone https://github.com/leshanydy2022/luci-app-smartdns.git feeds/luci/applications/luci-app-smartdns
rm -rf feeds/other/luci-app-adguardhome
git clone https://github.com/leshanydy2022/luci-app-adguardhome.git feeds/other/luci-app-adguardhome
# 替换默认主题为Modify default theme（FROM luci-theme-bootstrap CHANGE TO luci-theme-bootstrap-mod）
sed -i 's/luci-theme-bootstrap/luci-theme-bootstrap-mod/g' ./feeds/luci/collections/luci/Makefile
#修改活动连接数
#sed -i 's/16384/65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
#修改 Linux 内核版本-注意 Makefile 文件的路径
#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.19/g' ./target/linux/x86/Makefile
# 为adguardhome插件更换最新的版本
rm -rf feeds/packages/net/adguardhome
git clone https://github.com/leshanydy2022/adguardhome.git feeds/packages/net/adguardhome
# 为smartDNS插件更换最新的版本
rm -rf feeds/packages/net/smartdns
#git clone https://github.com/pymumu/openwrt-smartdns.git feeds/packages/net/smartdns
git clone https://github.com/leshanydy2022/smartdns.git feeds/packages/net/smartdns
#修改TPLINK内核为8M
rm -rf target/linux/ar71xx/image/tiny-tp-link.mk
#sed -i 's/tplink-4mlzma/tplink-8mlzma/g' target/linux/ar71xx/image/tiny-tp-link.mk
svn export https://github.com/leshanydy2022/TPLINK-8M/branches/main/tiny-tp-link.mk
#修改水星4530内核为16M
rm -rf target/linux/ar71xx/image/generic-tp-link.mk
#sed -i 's/tplink-8mlzma/tplink-16mlzma/g' target/linux/ar71xx/image/generic-tp-link.mk
svn export https://github.com/leshanydy2022/MW4530r-16M/branches/main/generic-tp-link.mk
