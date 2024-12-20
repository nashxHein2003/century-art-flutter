import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class KIconButton extends StatefulWidget {
  const KIconButton(
      {super.key,
      required this.icon,
      this.color = Colors.white,
      this.bgColor = Colors.transparent,
      this.size = 30,
      this.onTap});

  final IconData icon;
  final Color? bgColor;
  final Color color;
  final double size;
  final VoidCallback? onTap;

  @override
  State<KIconButton> createState() => _KIconButtonState();
}

class _KIconButtonState extends State<KIconButton> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Icon(
            widget.icon,
            color: _isHovered ? kPrimary : widget.color,
            size: widget.size,
          ),
        ),
      ),
    );
  }
}
