#!/bin/env bash

set -e
set -x

# Meta script for building all architectures of an OS

os="$1"
archs=""

case "$os" in
"debian")
    archs=(
        'amd64'
        'i386'
        # 'arm64'
        # 'armel'
        # 'mips64el'
        # 'ppc64el'
        # 's390x'
    )
    ;;
"alpine")
    archs=(
        'x86_64'
        # 'x86'
        # 'aarch64'
        # 'armv7'
        # 'ppc64le'
        # 's390x'
    )
    ;;
"freebsd")
    archs=(
        'amd64'
        # 'arm64-aarch64'
        # 'i386'
        # 'powerpc-powerpc64le'
        # 'riscv-riscv64'
    )
    ;;
*)
    echo "Invalid OS chosen."
    exit
    ;;
esac

for arc in ${archs[@]}
do
    ./generate/$os.sh $arc
done
