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
rm -rf package/feeds/luci/luci-app-passwall/
rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box,chinadns-ng}
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
# https://github.com/sbwml/openwrt_helloworld
sed -i 's/api.is_finded("fw3")/api.is_finded("fw30")/g' package/helloworld/luci-app-passwall/luasrc/model/cbi/passwall/client/other.lua
sed -i 's/192.168.1.1/10.10.10.6/g' package/base-files/files/bin/config_generate
