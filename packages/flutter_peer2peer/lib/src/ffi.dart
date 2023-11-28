import 'package:peer2peer/peer2peer.dart';

import 'ffi/stub.dart'
    if (dart.library.io) 'ffi/io.dart'
    if (dart.library.html) 'ffi/web.dart';

Peer2Peer createLib() => createWrapper(createLibraryImpl());
