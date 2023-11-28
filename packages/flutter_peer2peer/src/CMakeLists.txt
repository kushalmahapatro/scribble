# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_peer2peer_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_peer2peer SHARED
  "flutter_peer2peer.c"
)

set_target_properties(flutter_peer2peer PROPERTIES
  PUBLIC_HEADER flutter_peer2peer.h
  OUTPUT_NAME "flutter_peer2peer"
)

target_compile_definitions(flutter_peer2peer PUBLIC DART_SHARED_LIB)
