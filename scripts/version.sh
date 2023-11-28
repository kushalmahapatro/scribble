#!/bin/bash

CURR_VERSION=dart_peer2peer-v`awk '/^version: /{print $2}' packages/dart_peer2peer/pubspec.yaml`

# iOS & macOS
APPLE_HEADER="release_tag_name = '$CURR_VERSION' # generated; do not edit"
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_peer2peer/ios/flutter_peer2peer.podspec
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_peer2peer/macos/flutter_peer2peer.podspec
rm packages/flutter_peer2peer/macos/*.bak packages/flutter_peer2peer/ios/*.bak

# CMake platforms (Linux, Windows, and Android)
CMAKE_HEADER="set(LibraryVersion \"$CURR_VERSION\") # generated; do not edit"
for CMAKE_PLATFORM in android linux windows
do
    sed -i.bak "1 s/.*/$CMAKE_HEADER/" packages/flutter_peer2peer/$CMAKE_PLATFORM/CMakeLists.txt
    rm packages/flutter_peer2peer/$CMAKE_PLATFORM/*.bak
done

git add packages/flutter_peer2peer/