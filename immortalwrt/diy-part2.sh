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
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 26.x feeds/packages/lang/golang


rm -rf package/feeds/luci/luci-app-passwall/
rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box,chinadns-ng}
git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/openwrt-passwall
git clone https://github.com/Openwrt-Passwall/openwrt-passwall.git package/passwall
git clone https://github.com/nikkinikki-org/OpenWrt-momo.git package/OpenWrt-momo


rm -rf package/luci-app-amlogic
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git package/luci-app-nikki

rm -rf package/feeds/luci/luci-app-openclash/
git_sparse_clone dev https://github.com/vernesong/OpenClash luci-app-openclash

sed -i 's/192.168.1.1/10.10.10.6/g' package/base-files/files/bin/config_generate
