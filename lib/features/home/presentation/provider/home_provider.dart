import 'package:century_art_flutter/core/util/locator.dart';
import 'package:century_art_flutter/core/util/shared/shared_preference_provider.dart';
import 'package:century_art_flutter/features/home/dto/home_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomeProvider extends ChangeNotifier {
  final Logger log = Logger();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final sharedPreference = getIt<SharedPreferenceProvider>();

  Future<void> getUserInfo() async {
    User? user = _auth.currentUser;

    if (user != null) {
      UserInformationDTO userInformationDTO = UserInformationDTO(
          id: user.uid, email: user.email ?? '', name: user.displayName ?? '');

      await sharedPreference.setUserInformation(userInformationDTO);
    } else {
      log.i('No user is signed in');
    }
  }

  void getUser() async {}
}
