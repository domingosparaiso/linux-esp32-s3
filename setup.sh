#!/bin/bash

apt update
apt upgrade
apt install git make cmake gcc automake flex bison texinfo help2man gawk libtool libtool-bin libncurses-dev libc++-dev g++ bzip2 xz-utils unzip bc rsync cpio gperf zlib1g zlib1g-dev wget

mkdir -p /opt/esp32/scritps
chown -R esp32:esp32 /opt/esp32

cp install-*.sh /opt/esp32/scritps
cd /opt/esp32/scritps

/opt/esp32/scripts/install-python.sh
/opt/esp32/scripts/install-autoconf.sh
export PATH="$PATH:/opt/esp32/autoconf-2.71/root/bin"
/opt/esp32/scripts/install-dynconfig.sh
export XTENSA_GNU_CONFIG="/opt/esp32/xtensa-dynconfig/esp32s3.so"
# ct-ng cannot run as root, we'll just do everything else as a user
sudo esp32 /opt/esp32/scripts/install-toolchain.sh
/opt/esp32/scripts/install-bootloader.sh
/opt/esp32/scripts/install-kernel.sh

#
# flash
#
# activate idf.py with . ./export.sh
# copy bootloader.bin partition-table.bin network_adapter.bin xipImage rootfs.cramfs and etc.jffs2 to your host machine
# flash bootloader, partition table and network adapter
# esptool.py --chip esp32s3 -p /dev/ttyACM0 -b 921600 --before=default_reset --after=hard_reset write_flash 0x0 bootloader.bin 0x10000 network_adapter.bin 0x8000 partition-table.bin
# flash the system partitions
# parttool.py -p /dev/ttyACM0 -b 921600 write_partition --partition-name linux  --input xipImage
# parttool.py -p /dev/ttyACM0 -b 921600 write_partition --partition-name rootfs --input rootfs.cramfs
# parttool.py -p /dev/ttyACM0 -b 921600 write_partition --partition-name etc --input etc.jffs2

# Second Method - Running inside container

# run container from image:
# sudo docker run --device=/dev/ttyACM0 -it esp32s3-linux

# Download Tools for ESP32S3 Flashing
# /app/build/esp-hosted/esp_hosted_ng/esp/esp_driver/esp-idf/install.sh
# esptool.py --chip esp32s3 -p /dev/ttyACM0 -b 921600 --before=default_reset --after=hard_reset write_flash 0x0 ./build/esp-hosted/esp_hosted_ng/esp/esp_driver/network_adapter/build/bootloader/bootloader.bin 0x10000 ./build/esp-hosted/esp_hosted_ng/esp/esp_driver/network_adapter/build/network_adapter.bin 0x8000 ./build/esp-hosted/esp_hosted_ng/esp/esp_driver/network_adapter/build/partition_table/partition-table.bin

# parttool.py -p /dev/ttyACM0 -b 921600 write_partition --partition-name linux  --input ./build/build-buildroot-esp32s3/images/xipImage
# parttool.py -p /dev/ttyACM0 -b 921600 write_partition --partition-name rootfs --input ./build/build-buildroot-esp32s3/images/rootfs.cramfs
# parttool.py -p /dev/ttyACM0 -b 921600 write_partition --partition-name etc --input ./build/build-buildroot-esp32s3/images/etc.jffs2
