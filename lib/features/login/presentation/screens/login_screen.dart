import 'package:century_art_flutter/core/constants/constants.dart';
import 'package:century_art_flutter/core/presentation/widgets/widgets.dart';
import 'package:century_art_flutter/features/home/presentation/provider/home_provider.dart';
import 'package:century_art_flutter/features/login/presentation/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:century_art_flutter/core/extensions/context_extensions.dart';
import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

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
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    void _login(String email, String password) async {
      await loginProvider.loginWithEmailAndPassword(email, password);
      if (loginProvider.appStatus != AppStatus.error) {
        homeProvider.getUser();
        if (mounted) {
          setState(() {
            context.go('/');
          });
        }
      }
    }

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
                FormTextFieldSetWidget(
                  label: enterYourEmail,
                  controller: _emailController,
                ),
                const Gap(10),
                FormTextFieldSetWidget(
                  label: enterYourPassword,
                  obsecureText: true,
                  controller: _passwordController,
                ),
                const Gap(20),
                KTextButtonWidget(
                  name: loginCap,
                  height: 48,
                  bgColor: kPrimary,
                  onTap: () {
                    _login(_emailController.text, _passwordController.text);
                  },
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
