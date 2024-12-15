import 'package:century_art_flutter/core/constants/size.dart';
import 'package:century_art_flutter/features/gallery/presentation/providers/gallery_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryProvider>(
      builder: (context, provider, child) {
        if (provider.arts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: kP10,
          child: SingleChildScrollView(
              child: Wrap(
                  runAlignment: WrapAlignment.start,
                  children: provider.arts.asMap().entries.map((entry) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Image.network(
                        entry.value.imageUrl,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList())),
        );
        // return SizedBox(
        //   child: Image.network(
        //     provider.arts.first.imageUrl,
        //     width: 300,
        //     height: 200,
        //   ),
        // );
      },
    );
  }
}
