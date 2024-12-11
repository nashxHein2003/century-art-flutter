import 'package:century_art_flutter/core/constants/image_constant.dart';
import 'package:century_art_flutter/core/constants/size.dart';
import 'package:century_art_flutter/core/constants/strings.dart';
import 'package:century_art_flutter/core/presentation/widgets/k_text_button_widget.dart';
import 'package:century_art_flutter/core/presentation/widgets/text_button_widget.dart';
import 'package:century_art_flutter/core/presentation/widgets/app_logo.dart';
import 'package:century_art_flutter/core/presentation/widgets/via_sign_widget.dart';
import 'package:century_art_flutter/features/login/presentation/widgets/form_text_field_set_widget.dart';
import 'package:flutter/material.dart';
import 'package:century_art_flutter/core/extensions/context_extensions.dart';
import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.screenSize.height,
          ),
          child: Center(
            child: Container(
                width: 800,
                height: 700,
                padding: kV40,
                child: Row(
                  children: [_buildImage(), _buildForm(context)],
                )),
          ),
        ),
      ),
    );
  }

  Expanded _buildForm(BuildContext context) {
    return Expanded(
        child: Container(
      color: kWhite,
      padding: kP14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.close_rounded, size: 30),
              color: kBlack,
            ),
          ),
          const Gap(40),
          Padding(
            padding: kH20V20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      login,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    AppLogo(
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontSize: 40),
                    )
                  ],
                ),
                const Gap(30),
                const FormTextFieldSetWidget(
                  label: enterYourEmail,
                ),
                const Gap(10),
                const FormTextFieldSetWidget(
                  label: enterYourPassword,
                  obsecureText: true,
                ),
                const Gap(20),
                TextButtonWidget(
                  name: loginCap,
                  height: 48,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  bgColor: kPrimary,
                  hoverTextColor: kWhite,
                  hoverBgColor: kPrimary,
                ),
                const Gap(20),
                Row(
                  children: [
                    Text(
                      toBePartOfCommunity,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: kBlack),
                    ),
                    KTextButtonWidget(
                      name: joinCenturyArt,
                      textStyle: const TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                      onTap: () => context.go('/register'),
                    )
                  ],
                ),
                const Gap(20),
                const ViaSignWidget(name: signInWithGoogle, image: googleIcon),
                const Gap(20),
                Text(
                  loginPolicy,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: kBlack),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Expanded _buildImage() {
    return Expanded(
        child: Image.asset(
      'assets/images/feature/yelan.jpg',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    ));
  }
}
