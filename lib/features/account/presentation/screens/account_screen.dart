import 'package:century_art_flutter/core/constants/size.dart';
import 'package:century_art_flutter/core/extensions/context_extensions.dart';
import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:century_art_flutter/core/presentation/widgets/k_layout.dart';
import 'package:century_art_flutter/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KLayout(
        child: Stack(
      children: [
        SizedBox(
          width: context.screenSize.width,
          height: context.screenSize.height,
          child: Column(
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
                          child: Image.asset(
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
                              Text('Known as',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontSize: 32)),
                              Text(
                                'username',
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
                        const KIconButton(
                          icon: Icons.settings,
                          color: Colors.grey,
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
