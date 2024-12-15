import 'package:century_art_flutter/core/constants/status.dart';
import 'package:century_art_flutter/core/data/failure/auth_exception.dart';
import 'package:century_art_flutter/core/util/locator.dart';
import 'package:century_art_flutter/core/util/shared/shared_preference_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final sharedPreference = getIt<SharedPreferenceProvider>();

  //AppStatus
  AppStatus _appStatus = AppStatus.init;
  AppStatus get appStatus => _appStatus;

  Future<void> loginWithEmailAndPassword(
      final String email, final String password) async {
    _appStatus = AppStatus.loading;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      sharedPreference.authenticated();
      _appStatus = AppStatus.loaded;
    } on FirebaseAuthException catch (e) {
      _appStatus = AppStatus.error;
      if (e.code == 'weak-password') {
        AuthException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        AuthException(message: 'An account already exists with that email.');
      }
    }
  }
}
