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
      fontSize: 36,
      fontFamily: tiny5,
      color: kPrimary,
    ),
    bodyLarge: TextStyle(fontSize: 24, color: kWhite),
    bodyMedium: TextStyle(fontSize: 16, color: kWhite),
    bodySmall: TextStyle(fontSize: 11, color: kWhite),
  ),
  iconTheme: const IconThemeData(
    size: 25,
    color: kPrimary,
  ),
);
