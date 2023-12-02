#!/bin/bash

# Setup
BUILD_DIR=platform-build
mkdir $BUILD_DIR
cd $BUILD_DIR

# Install build dependencies
cargo install cargo-zigbuild

zig_build () {
    local TARGET="$1"
    local PLATFORM_NAME="$2"
    local LIBNAME="$3"
    rustup target add "$TARGET"
    if [ "$2" == "linux-x64" ]; then
        CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=/usr/bin/x86_64-linux-gnu-gcc \
        OPENSSL_DIR=`realpath ../packages/kbs_client/native/dependency/openssl/linux/x86_64` \
        cargo build --target "$TARGET" -r
    else
        cargo build --target "$TARGET" -r
    fi

    mkdir "$PLATFORM_NAME"
    cp "../target/$TARGET/release/$LIBNAME" "$PLATFORM_NAME/"
}

# Build all the dynamic libraries
LINUX_LIBNAME=libpeer2peer.so
zig_build aarch64-unknown-linux-gnu linux-arm64 $LINUX_LIBNAME
zig_build x86_64-unknown-linux-gnu linux-x64 $LINUX_LIBNAME

# Archive the dynamic libs
tar -czvf linux.tar.gz linux-*

# Cleanup
# rm -rf linux-*