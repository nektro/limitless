#!/bin/sh

set -e
set -x

# Meta script for building all architectures of an OS

os="$1"

case "$os" in
"debian")
    ./generate/debian.sh amd64
    ./generate/debian.sh i386
    # ./generate/debian.sh arm64
    # ./generate/debian.sh armel
    # ./generate/debian.sh mips64el
    # ./generate/debian.sh ppc64el
    # ./generate/debian.sh s390x
    ;;
*)
    echo "Invalid OS chosen."
    ;;
esac
