import 'package:century_art_flutter/core/extensions/context_extensions.dart';
import 'package:century_art_flutter/core/presentation/widgets/k_layout.dart';
import 'package:century_art_flutter/core/presentation/widgets/widgets.dart';
import 'package:century_art_flutter/features/gallery/presentation/providers/gallery_provider.dart';
import 'package:century_art_flutter/features/gallery/presentation/screens/gallery_screen.dart';
import 'package:century_art_flutter/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
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
    return KLayout(
      child: Stack(
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
                  width: 60,
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
}
