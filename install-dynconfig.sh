#!/bin/bash

cd /opt/esp32

# dynconfig
git clone https://github.com/jcmvbkbc/xtensa-dynconfig -b original --depth=1
git clone https://github.com/jcmvbkbc/config-esp32s3 esp32s3 --depth=1
make -C xtensa-dynconfig ORIG=1 CONF_DIR=`pwd` esp32s3.so
