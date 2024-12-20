import 'package:century_art_flutter/core/constants/constants.dart';
import 'package:century_art_flutter/core/extensions/context_extensions.dart';
import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:century_art_flutter/core/presentation/widgets/widgets.dart';
import 'package:century_art_flutter/core/util/shared/shared_preference_provider.dart';
import 'package:century_art_flutter/features/upload/presentation/widgets/submission_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

class KLayout extends StatefulWidget {
  const KLayout({super.key, required this.child});
  final Widget child;

  @override
  State<KLayout> createState() => _KLayoutState();
}

class _KLayoutState extends State<KLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: widget.child,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: const Center(
        child: KIconButton(icon: Icons.menu),
      ),
      leadingWidth: 70,
      centerTitle: true,
      title: Align(
        alignment: Alignment.centerLeft,
        child: AppLogo(
          onTap: () => context.go('/'),
        ),
      ),
      backgroundColor: kBlack,
      toolbarHeight: 70,
      actions: [
        Consumer<SharedPreferenceProvider>(
            builder: (BuildContext context, provider, Widget? child) {
          return provider.isAuthenticated
              ? const SizedBox()
              : TextButtonWidget(
                  name: 'Join',
                  onTap: () => context.go('/register'),
                );
        }),
        Consumer<SharedPreferenceProvider>(
            builder: (BuildContext context, provider, Widget? child) {
          return provider.isAuthenticated
              ? const SizedBox()
              : TextButtonWidget(
                  name: 'Login',
                  onTap: () => context.go('/login'),
                );
        }),
        Consumer<SharedPreferenceProvider>(
            builder: (BuildContext context, provider, Widget? child) {
          return provider.isAuthenticated
              ? KIconButton(
                  icon: Icons.person,
                  color: Colors.grey,
                  bgColor: Colors.grey[900],
                  onTap: () => context.go('/account'),
                )
              : const SizedBox();
        }),
        const Gap(20),
        TextButtonWidget(
          name: 'Submit',
          height: 40,
          iconName: Icons.add,
          padding: kH12,
          bgColor: kPrimary,
          hoverBgColor: kPrimaryHover,
          hoverTextColor: kWhite,
          onTap: () => showPopup(),
        ),
        const Gap(10),
      ],
    );
  }

  void showPopup() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              width: context.screenSize.width * 0.8,
              height: context.screenSize.height * 0.9,
              padding: kP14,
              color: k1a1a1a,
              child: const Material(
                color: Colors.transparent,
                child: SubmissionWidget(),
              ),
            ),
          );
        });
  }
}
