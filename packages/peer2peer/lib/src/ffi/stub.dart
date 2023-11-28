import 'package:peer2peer/src/bridge_generated.dart';

/// Represents the external library for peer2peer
///
/// Will be a DynamicLibrary for dart:io or WasmModule for dart:html
typedef ExternalLibrary = Object;

Peer2Peer createWrapperImpl(ExternalLibrary lib) => throw UnimplementedError();
