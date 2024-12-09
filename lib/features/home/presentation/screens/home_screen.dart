import 'package:century_art_flutter/core/constants/size.dart';
import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:century_art_flutter/features/home/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Center(
        child: Text('data'),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
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
      actions: [
        const TextButtonWidget(name: 'Join'),
        TextButtonWidget(
          name: 'Login',
          onTap: () => context.go('/login'),
        ),
        const Gap(10),
        TextButtonWidget(
          name: 'Submit',
          height: 40,
          iconName: Icons.add,
          padding: kH12,
          bgColor: kPrimary,
          hoverBgColor: kPrimaryHover,
          hoverTextColor: kWhite,
        ),
        const Gap(10),
      ],
    );
  }
}
