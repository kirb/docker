#!/bin/bash
set -e

mkdir -p /tftproot
ln -s /config /tftproot/config
ln -s /config/dnsmasq.conf /etc/dnsmasq.conf
ln -s /config/dnsmasq.d /etc/dnsmasq.d

apt-get update
apt-get install -y dnsmasq curl \
	build-essential binutils-dev liblzma-dev syslinux
rm -r /var/cache/apt

mkdir /build
cd /build

curl -L https://github.com/ipxe/ipxe/archive/master.tar.gz -o ipxe.tar.gz
tar -xf ipxe.tar.gz
cd ipxe-*/src/

make -j$(nproc) \
	bin/undionly.kpxe \
	bin-i386-efi/ipxe.efi \
	bin-x86_64-efi/ipxe.efi

cp bin/undionly.kpxe /tftproot/undionly.kpxe
cp bin-i386-efi/ipxe.efi /tftproot/ipxe-i386.efi
cp bin-x86_64-efi/ipxe.efi /tftproot/ipxe-x86_64.efi

cd /
rm -rf /build
