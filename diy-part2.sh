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
sed -i 's/192.168.1.1/10.10.10.6/g' package/base-files/files/bin/config_generate

#'godproxy'
# rm -rf package/lean/luci-app-godproxy
# git clone https://github.com/godros/luci-app-godproxy.git package/lean/luci-app-godproxy


git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/lean/luci-theme-edge

git clone https://github.com/thinktip/luci-theme-neobird.git package/lean/luci-theme-neobird

sed -i 's/shadowsocksr/passwall/g' package/lean/luci-theme-neobird/luasrc/view/themes/neobird/header.htm
 
 
#'设置默认主题'
default_theme='neobird'	
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci
