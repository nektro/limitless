#!/bin/sh

set -e

# https://www.debian.org/
# https://wiki.debian.org/DebianInstaller/Preseed/EditIso


os="debian"
version="10.10.0"
arch="$1"

if [ -z "$arch" ]
then
    echo "Must pass an arch value."
    exit
fi

set -x

iso="debian-$version-$arch-netinst.iso"
url="https://cdimage.debian.org/mirror/cdimage/archive/$version/$arch/iso-cd/$iso"

zigarch=$(zig run tools/os-zigify-arch.zig -- "$os" "$arch")
hdd="images/$os.$zigarch.qcow2"


#
# ensure we have the iso on disk
mkdir -p iso
wget -P iso --no-clobber --quiet --show-progress $url


if [ ! -f $hdd ]
then
    # add preseed file and repackage iso
    udevil mount iso/$iso

    isosrc="/media/$USER/$iso"
    isodst="isofiles"
    cp -RT $isosrc $isodst
    install="$isodst/$(ls isofiles | grep 'install.')"

    chmod +w -R $install/
    gzip -d $install/initrd.gz
    echo preseed.cfg | cpio -H newc -o -A -F $install/initrd
    gzip $install/initrd
    chmod -w -R $install/

    cd $isodst
    chmod +w md5sum.txt
    find -follow -type f ! -name md5sum.txt -print0 | xargs -0 md5sum > md5sum.txt
    chmod -w md5sum.txt
    cd -

    sudo genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed-$iso $isodst

    udevil umount /media/snuc/$iso
    chmod +w -R $isodst
    rm -r $isodst
    sudo isohybrid preseed-$iso

    # create qemu 32 GB disk
    mkdir -p images
    qemu-img create -f qcow2 $hdd 32G

    # run qemu disk with iso installer
    kvm \
        -m 2048 \
        -hda $hdd \
        -boot d \
        -cdrom preseed-$iso \
        -net nic -net user \

    # iso is no longer needed, install succeeded
    rm -f preseed-$iso
fi
