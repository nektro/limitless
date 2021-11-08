#!/bin/sh

set -e

# https://alpinelinux.org/
#


os="alpine"
arch="$1"
version="3.14.2"

if [ -z "$arch" ]
then
    echo "Must pass an arch value."
    exit
fi

set -x

iso="alpine-virt-$version-$arch.iso"
url="https://dl-cdn.alpinelinux.org/alpine/v3.14/releases/$arch/$iso"

hdd="images/$os.$arch.qcow2"


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
        -nographic \

    # TODO automate installer
    # run `setup-alpine`
fi
