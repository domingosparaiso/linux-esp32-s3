#!/bin/bash
#
# bootloader
#
export IDF_PATH="/opt/esp32/build/esp-hosted/esp_hosted_ng/esp/esp_driver/esp-idf"
mkdir -p cd /opt/esp32/build
cd /opt/esp32/build
git clone https://github.com/jcmvbkbc/esp-hosted -b ipc
cd esp-hosted/esp_hosted_ng/esp/esp_driver
cmake .
cd esp-idf
. ./export.sh
cd ../network_adapter
idf.py set-target esp32s3
cp sdkconfig.defaults.esp32s3 sdkconfig
idf.py build
