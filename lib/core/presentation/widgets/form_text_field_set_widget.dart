import 'package:century_art_flutter/core/presentation/widgets/k_text_field_widget.dart';
import 'package:flutter/material.dart';

class FormTextFieldSetWidget extends StatefulWidget {
  const FormTextFieldSetWidget(
      {super.key,
      required this.label,
      this.style,
      this.width,
      this.height,
      this.controller,
      this.keyboardType,
      this.obsecureText = false,
      this.onChanged,
      this.onSubmitted});
  final String label;
  final TextStyle? style;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final bool obsecureText;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;

  @override
  State<FormTextFieldSetWidget> createState() => _FormTextFieldSetWidgetState();
}

class _FormTextFieldSetWidgetState extends State<FormTextFieldSetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: widget.style ??
              Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
        ),
        KTextFieldWidget(
          width: widget.width,
          height: widget.height,
          controller: widget.controller,
          obsecureText: widget.obsecureText,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
        )
      ],
    );
  }
}
