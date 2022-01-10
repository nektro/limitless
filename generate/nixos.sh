#!/bin/sh

set -e

# https://nixos.org/
#


os="nixos"
arch="$1"
version="21.05"

if [ -z "$arch" ]
then
    echo "Must pass an arch value."
    exit
fi

set -x

iso="nixos-minimal-$arch-$version.iso"
url="https://channels.nixos.org/nixos-$version/latest-nixos-minimal-$arch-linux.iso"

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

    # TODO find installer
    # TODO automate installer
fi
