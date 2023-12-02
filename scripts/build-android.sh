#!/bin/bash

# Setup
BUILD_DIR=platform-build
mkdir $BUILD_DIR
cd $BUILD_DIR

# Create the jniLibs build directory
JNI_DIR=jniLibs
mkdir -p $JNI_DIR

# Set up cargo-ndk
cargo install cargo-ndk
rustup target add \
        aarch64-linux-android \
        x86_64-linux-android \

# Build the android libraries in the jniLibs directory
echo `pwd`
OPENSSL_DIR=`realpath ../packages/kbs_client/native/dependency/openssl/android/arm64-v8a` \
cargo ndk -o $JNI_DIR \
        --manifest-path ../Cargo.toml \
        -t arm64-v8a \
        build --release

OPENSSL_DIR=`realpath ../packages/kbs_client/native/dependency/openssl/android/x86_64` \
cargo ndk -o $JNI_DIR \
        --manifest-path ../Cargo.toml \
        -t x86_64 \
        build --release

# Archive the dynamic libs
cd $JNI_DIR
tar -czvf ../android.tar.gz *
cd -

ANDROID_JNI_DIR=../packages/flutter_kbs_client/android/src/main/${JNI_DIR}
if [ -d ${ANDROID_JNI_DIR} ]; then
    rm -rf ${ANDROID_JNI_DIR}
fi
mv ${JNI_DIR} $ANDROID_JNI_DIR
# Cleanup
# rm -rf $JNI_DIR