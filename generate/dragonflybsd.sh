#!/bin/sh

set -e

# https://www.dragonflybsd.org/
#


os="dragonflybsd"
arch="$1"
version="6.0.1"

if [ -z "$arch" ]
then
    echo "Must pass an arch value."
    exit
fi

set -x

iso="dfly-$arch-${version}_REL.iso"
url="http://mirror-master.dragonflybsd.org/iso-images/$iso"

zigarch=$(zig run tools/os-zigify-arch.zig -- "$os" "$arch")
hdd="images/$os.$zigarch.qcow2"


#
# ensure we have the iso on disk
mkdir -p iso
wget -P iso --no-clobber --quiet --show-progress $url


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
    # NOTE To start the installer, login as 'installer'. To get a shell prompt, login as 'root'
fi
