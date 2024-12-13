import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ViaSignWidget extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  final String image;
  const ViaSignWidget(
      {super.key, required this.name, this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 40,
          decoration:
              BoxDecoration(border: Border.all(color: kBlack.withOpacity(0.4))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 20,
                height: 20,
              ),
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: kBlack),
              )
            ],
          ),
        ),
      ),
    );
  }
}
