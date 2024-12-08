import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'CenturyArt',
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
