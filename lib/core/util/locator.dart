import 'package:century_art_flutter/core/util/shared/app_state_provider.dart';
import 'package:century_art_flutter/core/util/shared/shared_preference_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  try {
    final sharedPreference = await SharedPreferences.getInstance();

    getIt.registerSingleton<SharedPreferenceProvider>(
        SharedPreferenceProvider(sharedPreference));
    getIt.registerSingleton<AppStateProvider>(AppStateProvider());
    await getIt.allReady();
  } catch (e) {
    debugPrint('$e');
  }
}
