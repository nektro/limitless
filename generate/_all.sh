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
"netbsd")
    archs=(
        'amd64'
        # 'evbarm-aarch64'
        # 'i386'
        # 'evbarm-earm'
        # 'evbmips-mips64el'
        # 'sparc64'
    )
    ;;
"openbsd")
        'amd64'
        # 'arm64'
        # 'i386'
        # 'armv7'
        # 'riscv64'
        # 'powerpc64'
        # 'sparc64'
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
