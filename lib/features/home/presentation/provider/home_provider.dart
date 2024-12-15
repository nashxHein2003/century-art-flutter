import 'package:century_art_flutter/core/util/locator.dart';
import 'package:century_art_flutter/core/util/shared/shared_preference_provider.dart';
import 'package:century_art_flutter/features/home/dto/home_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomeProvider extends ChangeNotifier {
  final Logger log = Logger();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final sharedPreference = getIt<SharedPreferenceProvider>();

  HomeProvider() {
    getUser();
  }

  void getUser() async {
    User? user = _auth.currentUser;
    print('Call Function');
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        var userInfo = snapshot.data() as Map<String, dynamic>;
        UserInformationDTO userInformationDTO = UserInformationDTO(
            id: user.uid,
            email: userInfo['email'],
            name: userInfo['name'],
            knownAs: userInfo['known_as'],
            avatar: userInfo['profile_url']);
        await sharedPreference.setUserInformation(userInformationDTO);
        sharedPreference.authenticated();
        notifyListeners();
      }
    } else {
      log.i('No user is signed in');
      notifyListeners();
    }
  }
}
