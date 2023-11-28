import 'package:peer2peer/src/bridge_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

typedef ExternalLibrary = WasmModule;

Peer2Peer createWrapperImpl(ExternalLibrary module) =>
    Peer2PeerImpl.wasm(module);
