#!/bin/bash
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

 sudo apt-get install pigz

# git clone  https://github.com/QiuSimons/openwrt-mos.git package/luci-app-mosdns

# sed -i "s/127.0.0.1/127.0.0.1:5335/g"   package/luci-app-mosdns/root/etc/mosdns/set.sh

# 添加SSR-Plus
rm -rf package/luci-app-ssr-plus
# git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus
git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus
# 添加PassWall
rm -rf package/passwall
rm -rf package/luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite package/luci-app-msd_lite
git clone --depth=1 https://github.com/ximiTech/msd_lite package/msd_lite

# 修改本地时间格式
sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修改版本为编译日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version} by Haiibo/g" package/lean/default-settings/files/zzz-default-settings
