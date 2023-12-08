#!/bin/bash

cd /opt/esp32
# install autoconf 2.71
curl -O https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
tar -xf autoconf-2.71.tar.xz
cd autoconf-2.71
./configure --prefix=`pwd`/root
make
make install
