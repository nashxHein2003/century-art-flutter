import 'package:century_art_flutter/core/theme/app_theme.dart';
import 'package:century_art_flutter/features/home/presentation/widgets/icon_button_widget.dart';
import 'package:century_art_flutter/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Center(
        child: Text('data'),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: const Center(
        child: IconButtonWidget(icon: Icons.menu, color: kWhite),
      ),
      leadingWidth: 70,
      centerTitle: true,
      title: const Align(
        alignment: Alignment.centerLeft,
        child: AppLogo(),
      ),
      backgroundColor: kBlack,
      toolbarHeight: 70,
      actions: const [
        TextButtonWidget(name: 'Join'),
        TextButtonWidget(name: 'Login')
      ],
    );
  }
}
