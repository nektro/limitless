#!/bin/sh

set -e

# http://9front.org/
#


os="9front" # plan9
arch="$1"
version="8593.acc504c319a4b4188479cfa602e40cb6851c0528"

if [ -z "$arch" ]
then
    echo "Must pass an arch value."
    exit
fi

set -x

iso="$os-$version.amd64.iso"
url="http://9front.org/iso/$iso.gz"

zigarch=$(zig run tools/os-zigify-arch.zig -- "$os" "$arch")
hdd="images/$os.$zigarch.qcow2"


#
# ensure we have the iso on disk
mkdir -p iso
wget -P iso --no-clobber --quiet --show-progress $url
yes n | gunzip -k iso/$iso.gz


if [ ! -f $hdd ]
then
    #
    # create qemu 32 GB disk
    mkdir -p images
    qemu-img create -f qcow2 $hdd 32G

    #
    # run qemu disk with iso installer
    qemu-system-$zigarch \
        -m 2048 \
        -hda $hdd \
        -boot d \
        -cdrom iso/$iso \
        -net nic -net user \

    # TODO find installer
    # TODO automate installer
fi
