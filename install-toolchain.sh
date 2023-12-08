#!/bin/bash

mkdir -p /opt/esp32/build
cd /opt/esp32/build

# toolchain
cd /opt/esp32/build
git clone https://github.com/jcmvbkbc/crosstool-NG.git -b xtensa-fdpic --depth=1
cd crosstool-NG
./bootstrap
./configure --enable-local
make
./ct-ng xtensa-esp32s3-linux-uclibcfdpic
CT_PREFIX=`pwd`/builds ./ct-ng build || echo "Completed"  # the complete ct-ng build fails but we still get what we wanted!
[ -e build/crosstool-NG/builds/xtensa-esp32s3-linux-uclibcfdpic/bin/xtensa-esp32s3-linux-uclibcfdpic-gcc ] || exit 1
