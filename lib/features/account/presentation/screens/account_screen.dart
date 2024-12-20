import 'package:century_art_flutter/core/constants/size.dart';
import 'package:century_art_flutter/core/extensions/context_extensions.dart';
import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:century_art_flutter/core/presentation/widgets/k_layout.dart';
import 'package:century_art_flutter/core/presentation/widgets/widgets.dart';
import 'package:century_art_flutter/core/util/shared/shared_preference_provider.dart';
import 'package:century_art_flutter/features/account/presentation/providers/account_provider.dart';
import 'package:century_art_flutter/features/account/presentation/screens/account_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

enum WidgetSelector { info, setting }

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  WidgetSelector selectedWidget = WidgetSelector.info;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final shared =
          Provider.of<SharedPreferenceProvider>(context, listen: false);
      final accountProvider =
          Provider.of<AccountProvider>(context, listen: false);

      final uid = shared.prefs.getString('id');
      print('uid: $uid');
      accountProvider.getUserInfo(uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return KLayout(child: getSelectedWidget());
  }

  Widget getSelectedWidget() {
    switch (selectedWidget) {
      case WidgetSelector.info:
        return _accountInfo();
      case WidgetSelector.setting:
        return AccountSettingScreen(
          onBack: () {
            setState(() {
              selectedWidget = WidgetSelector.info;
            });
          },
        );
    }
  }

  SizedBox _accountInfo() {
    return SizedBox(
      width: context.screenSize.width,
      height: context.screenSize.height,
      child: Consumer<AccountProvider>(builder: (context, provider, child) {
        final info = provider.accountInfo;
        return Column(
          children: [
            Container(
              height: 300,
              color: k1a1a1a,
              padding: kH26,
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: info.profileURL != null
                            ? Image.network(info.profileURL ?? '',
                                height: 100, width: 100, fit: BoxFit.cover)
                            : Image.asset(
                                'assets/images/sample/profile.jpg',
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                      ),
                      const Gap(20),
                      SizedBox(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(info.knownAs ?? 'Anonymous',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontSize: 32)),
                            Text(
                              info.name ?? 'Anonymous',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: 18),
                            ),
                            Text(
                              'Follower count',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      TextButtonWidget(
                        name: 'Add Cover Image',
                        height: 40,
                        iconName: Icons.add,
                        bgColor: kPrimary,
                        hoverBgColor: kPrimaryHover,
                        hoverTextColor: kWhite,
                        borderRadius: 20,
                      ),
                      const Gap(20),
                      KIconButton(
                        icon: Icons.settings,
                        color: Colors.grey,
                        onTap: () {
                          setState(() {
                            selectedWidget = WidgetSelector.setting;
                          });
                        },
                      )
                    ],
                  ))
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
