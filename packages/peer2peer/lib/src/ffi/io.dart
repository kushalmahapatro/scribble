import 'dart:ffi';

import 'package:peer2peer/src/bridge_generated.dart';

typedef ExternalLibrary = DynamicLibrary;

Peer2Peer createWrapperImpl(ExternalLibrary dylib) =>
    Peer2PeerImpl(dylib);
