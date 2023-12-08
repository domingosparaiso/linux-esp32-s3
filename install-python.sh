#!/bin/bash

cd /opt/esp32
# Openssl 1.1.1
curl -O https://www.openssl.org/source/openssl-1.1.1d.tar.gz
tar -xf openssl-1.1.1d.tar.gz
cd openssl-1.1.1d
./config --prefix=/usr/local/openssl --libdir=lib --openssldir=etc/ssl
make -j1 depend
make -j8
make install_sw

cd /opt/esp32
# Python 3.10 required, not 3.11
curl -O https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz
tar -xf Python-3.10.0.tgz
cd Python-3.10.0
./configure -C --with-openssl=/usr/local/openssl --with-openssl-rpath=auto
make -j8
make altinstall
ln -s /usr/local/bin/python3 /usr/bin/python

# Install virtualenv using pip
python3 -m ensurepip
python3 -m pip install --upgrade pip
python3 -m pip install virtualenv
