import 'package:century_art_flutter/features/home/dto/home_dto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider extends ChangeNotifier {
  final SharedPreferences prefs;

  SharedPreferenceProvider(this.prefs);

  UserInformationDTO get getUserInformation => UserInformationDTO(
        id: prefs.getString('id') ?? '',
        name: prefs.getString('name') ?? '',
        email: prefs.getString('email') ?? '',
        avatar: prefs.getString('avatar') ?? '',
        knownAs: prefs.getString('known_as') ?? '',
      );

  bool get isAuthenticated => prefs.getBool('isAuthenticated') ?? false;

  Future<void> setUserInformation(UserInformationDTO userInformationDTO) async {
    final preferences = prefs;
    await preferences.setString('id', userInformationDTO.id);
    await preferences.setString('email', userInformationDTO.email ?? '');
    await preferences.setString('name', userInformationDTO.name ?? '');
    await preferences.setString('avatar', userInformationDTO.avatar ?? '');
    await preferences.setString('known_as', userInformationDTO.knownAs ?? '');
    print(userInformationDTO);
    notifyListeners();
  }

  void removeUserInformation() {
    prefs.remove('id');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('avatar');
    prefs.remove('known_as');
    notifyListeners();
  }

  void authenticated() {
    prefs.setBool('isAuthenticated', true);
  }
}
