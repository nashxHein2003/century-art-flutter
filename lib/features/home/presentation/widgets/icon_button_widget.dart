import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;
  final double? size;
  final ButtonStyle? style;
  const IconButtonWidget(
      {super.key,
      required this.icon,
      required this.color,
      this.onPressed,
      this.size = 30,
      this.style});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        style: style,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ));
  }
}
