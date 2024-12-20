import 'package:century_art_flutter/core/constants/constants.dart';
import 'package:century_art_flutter/core/extensions/context_extensions.dart';
import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:century_art_flutter/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenSize.width,
      height: context.screenSize.height,
      padding: kP10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButtonWidget(
            name: 'Back',
            iconName: Icons.arrow_back_ios,
            iconHoverColor: kPrimary,
            width: 100,
            onTap: onBack,
          )
        ],
      ),
    );
  }
}
