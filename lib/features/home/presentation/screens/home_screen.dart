import 'package:century_art_flutter/core/constants/size.dart';
import 'package:century_art_flutter/core/extensions/context_extensions.dart';
import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:century_art_flutter/core/presentation/widgets/k_side_bar_widget.dart';
import 'package:century_art_flutter/core/presentation/widgets/widgets.dart';
import 'package:century_art_flutter/core/util/shared/shared_preference_provider.dart';
import 'package:century_art_flutter/features/gallery/presentation/providers/gallery_provider.dart';
import 'package:century_art_flutter/features/gallery/presentation/screens/gallery_screen.dart';
import 'package:century_art_flutter/features/home/presentation/provider/home_provider.dart';
import 'package:century_art_flutter/features/upload/presentation/widgets/submission_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false);
      final galleryProvider =
          Provider.of<GalleryProvider>(context, listen: false);
      //homeProvider.getUser();
      galleryProvider.getArts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: context.screenSize.height,
          ),
          SizedBox(
            height: context.screenSize.height,
            width: context.screenSize.width,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height: context.screenSize.height,
                ),
                const Expanded(
                    child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: GalleryScreen()))
              ],
            ),
          ),
          const Positioned(left: 0, child: KSideBarWidget()),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: const Center(
        child: KIconButton(icon: Icons.menu),
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
          print('Authenticated: ${provider.isAuthenticated}');
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
