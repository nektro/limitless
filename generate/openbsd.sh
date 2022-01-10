#!/bin/sh

set -e

# https://www.openbsd.org/
#


os="openbsd"
arch="$1"
version="7.0"

if [ -z "$arch" ]
then
    echo "Must pass an arch value."
    exit
fi

set -x

iso="$os-$version-$arch.iso"
url="https://cdn.openbsd.org/pub/OpenBSD/$version/$arch/install70.iso"

zigarch=$(zig run tools/os-zigify-arch.zig -- "$os" "$arch")
hdd="images/$os.$zigarch.qcow2"


#
# ensure we have the iso on disk
mkdir -p iso
wget -P iso --no-clobber --quiet --show-progress -O iso/$iso $url


if [ ! -f $hdd ]
then
    #
    # create qemu 32 GB disk
    qemu-img create -f qcow2 $hdd 32G

    #
    # run qemu disk with iso installer
    kvm \
        -m 2048 \
        -hda $hdd \
        -boot d \
        -cdrom iso/$iso \
        -net nic -net user \

    # TODO automate installer
    # TODO /sbin/shutdown didn't exist
fi
