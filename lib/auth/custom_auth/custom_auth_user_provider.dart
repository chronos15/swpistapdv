import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class SoftworkAuthUser {
  SoftworkAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UsuarioDataTypeStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SoftworkAuthUser> softworkAuthUserSubject =
    BehaviorSubject.seeded(SoftworkAuthUser(loggedIn: false));
Stream<SoftworkAuthUser> softworkAuthUserStream() => softworkAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
