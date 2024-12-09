import 'package:century_art_flutter/core/presentation/widgets/k_text_field_widget.dart';
import 'package:flutter/material.dart';

class FormTextFieldSetWidget extends StatelessWidget {
  const FormTextFieldSetWidget(
      {super.key,
      required this.label,
      this.width,
      this.height,
      this.controller,
      this.keyboardType,
      this.obsecureText = false,
      this.onChanged,
      this.onSubmitted});
  final String label;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final bool obsecureText;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        KTextFieldWidget(
          width: width,
          height: height,
          controller: controller,
          obsecureText: obsecureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
        )
      ],
    );
  }
}
