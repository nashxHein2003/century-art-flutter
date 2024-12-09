import 'package:century_art_flutter/core/constants/size.dart';
import 'package:flutter/material.dart';

class KTextButtonWidget extends StatelessWidget {
  final String name;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final Color? splashColor;
  final Color? borderColor;
  final double borderRadius;
  final Color? bgColor;
  final VoidCallback? onTap;
  const KTextButtonWidget(
      {super.key,
      required this.name,
      this.textStyle,
      this.width,
      this.height,
      this.padding = kP10,
      this.splashColor,
      this.borderColor,
      this.borderRadius = 0.0,
      this.bgColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius),
          color: bgColor ?? Colors.transparent),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: splashColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: Center(
              child: Text(
                name,
                style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
