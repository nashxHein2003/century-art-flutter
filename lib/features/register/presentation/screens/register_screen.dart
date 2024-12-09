import 'package:century_art_flutter/core/constants/size.dart';
import 'package:century_art_flutter/core/constants/strings.dart';
import 'package:century_art_flutter/core/extensions/context_extensions.dart';
import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:century_art_flutter/core/presentation/widgets/k_text_button_widget.dart';
import 'package:century_art_flutter/features/home/presentation/widgets/widgets.dart';
import 'package:century_art_flutter/features/login/presentation/widgets/form_text_field_set_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                height: 650,
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
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.close_rounded,
              color: kBlack,
              size: 30,
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
                      register,
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
                  name: registerCap,
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
                      alreadyAMember,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: kBlack),
                    ),
                    KTextButtonWidget(
                      name: loginCenturyArt,
                      textStyle: const TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                      onTap: () => context.go('/login'),
                    )
                  ],
                ),
                const Gap(20),
                Text(
                  registerPolicy,
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
      fit: BoxFit.cover,
    ));
  }
}
