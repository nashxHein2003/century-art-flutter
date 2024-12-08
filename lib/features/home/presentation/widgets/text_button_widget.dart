import 'package:century_art_flutter/core/constants/size.dart';
import 'package:century_art_flutter/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  final String name;
  final double? height;
  final EdgeInsets? padding;
  final Color? bgColor;
  final Color? hoverBgColor;
  final Color? textColor;
  final Color? hoverTextColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Decoration? decoration;
  final VoidCallback? onTap;
  final IconData? iconName;
  final Color? iconColor;
  final Color? iconHoverColor;

  const TextButtonWidget({
    super.key,
    required this.name,
    this.height,
    this.padding = kH12,
    this.bgColor,
    this.hoverBgColor,
    this.textColor = kWhite,
    this.borderRadius,
    this.hoverTextColor = kPrimary,
    this.textStyle,
    this.decoration,
    this.onTap,
    this.iconName,
    this.iconColor = kWhite,
    this.iconHoverColor = kWhite,
  });

  @override
  TextButtonWidgetState createState() => TextButtonWidgetState();
}

class TextButtonWidgetState extends State<TextButtonWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: widget.padding,
          height: widget.height,
          decoration: widget.decoration ??
              BoxDecoration(
                color: _isHovered ? widget.hoverBgColor : widget.bgColor,
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
              ),
          child: Center(
            child: Row(
              children: [
                Icon(
                  widget.iconName,
                  color: _isHovered ? widget.iconHoverColor : widget.iconColor,
                ),
                Text(
                  widget.name,
                  style: widget.textStyle?.copyWith(
                        color: _isHovered
                            ? widget.hoverTextColor
                            : widget.textColor,
                      ) ??
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: _isHovered
                              ? widget.hoverTextColor
                              : widget.textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
