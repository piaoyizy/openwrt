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
 
# sudo add-apt-repository ppa:ubuntu-toolchain-r/test
# sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa
# sudo apt-get install -y gcc-13
# sudo apt-get install -y g++-13
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 60 --slave /usr/bin/g++ g++ /usr/bin/g++-13


sed -i 's/list listen_https/# list listen_https/' package/network/services/uhttpd/files/uhttpd.config


#'设置默认主题'
default_theme='Edge'	
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci
