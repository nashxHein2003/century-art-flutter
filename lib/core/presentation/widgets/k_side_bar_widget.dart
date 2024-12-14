import 'package:century_art_flutter/core/constants/size.dart';
import 'package:century_art_flutter/core/extensions/context_extensions.dart';
import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:century_art_flutter/core/presentation/widgets/k_icon_button.dart';
import 'package:flutter/material.dart';

class KSideBarWidget extends StatelessWidget {
  const KSideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenSize.height,
      color: kBlack,
      padding: kH14V26,
      child: const Column(
        spacing: 40,
        children: [
          KIconButton(icon: Icons.home),
          KIconButton(icon: Icons.chrome_reader_mode_outlined)
        ],
      ),
    );
  }
}
