import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class SOFTWORKPostoAuthUser {
  SOFTWORKPostoAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UsuarioDataTypeStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SOFTWORKPostoAuthUser> sOFTWORKPostoAuthUserSubject =
    BehaviorSubject.seeded(SOFTWORKPostoAuthUser(loggedIn: false));
Stream<SOFTWORKPostoAuthUser> sOFTWORKPostoAuthUserStream() =>
    sOFTWORKPostoAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
