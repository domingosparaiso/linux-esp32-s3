#!/bin/bash
#
# kernel and rootfs
#
cd /opt/esp32/build
git clone https://github.com/jcmvbkbc/buildroot -b xtensa-2023.08-fdpic
make -C buildroot O=`pwd`/build-buildroot-esp32s3 esp32s3_defconfig
buildroot/utils/config --file build-buildroot-esp32s3/.config --set-str TOOLCHAIN_EXTERNAL_PATH `pwd`/crosstool-NG/builds/xtensa-esp32s3-linux-uclibcfdpic
buildroot/utils/config --file build-buildroot-esp32s3/.config --set-str TOOLCHAIN_EXTERNAL_PREFIX '$(ARCH)-esp32s3-linux-uclibcfdpic'
buildroot/utils/config --file build-buildroot-esp32s3/.config --set-str TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX '$(ARCH)-esp32s3-linux-uclibcfdpic'
make -C buildroot O=`pwd`/build-buildroot-esp32s3
