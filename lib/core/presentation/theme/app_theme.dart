import 'package:flutter/material.dart';

const Color kBlack = Color(0xFF000000);
const Color k101010 = Color(0xff101010);
const Color kPrimary = Color(0xfff45000);
Color kPrimaryHover = kPrimary.withOpacity(0.3);
const Color kWhite = Colors.white;

const String tiny5 = 'Tiny5';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: k101010,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 40,
      fontFamily: tiny5,
      color: kPrimary,
    ),
    headlineLarge:
        TextStyle(fontSize: 36, color: kBlack, fontWeight: FontWeight.w700),
    headlineSmall:
        TextStyle(fontSize: 14, color: kBlack, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontSize: 24, color: kBlack),
    titleMedium: TextStyle(fontSize: 16, color: kBlack),
    titleSmall: TextStyle(fontSize: 14, color: kBlack),
    bodyLarge: TextStyle(fontSize: 24, color: kWhite),
    bodyMedium: TextStyle(fontSize: 14, color: kWhite),
    bodySmall: TextStyle(fontSize: 12, color: kWhite),
  ),
  iconTheme: const IconThemeData(
    size: 25,
    color: kPrimary,
  ),
);
