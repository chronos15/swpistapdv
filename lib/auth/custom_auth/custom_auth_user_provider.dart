import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class SOFTWORKPistaAuthUser {
  SOFTWORKPistaAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UsuarioDataTypeStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SOFTWORKPistaAuthUser> sOFTWORKPistaAuthUserSubject =
    BehaviorSubject.seeded(SOFTWORKPistaAuthUser(loggedIn: false));
Stream<SOFTWORKPistaAuthUser> sOFTWORKPistaAuthUserStream() =>
    sOFTWORKPistaAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
