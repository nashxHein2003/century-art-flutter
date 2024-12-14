import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class KTextFieldWidget extends StatelessWidget {
  const KTextFieldWidget(
      {super.key,
      this.width = 300,
      this.height,
      this.controller,
      this.keyboardType,
      this.obsecureText = false,
      this.onChanged,
      this.onSubmitted});
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final bool obsecureText;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height ?? 40,
        child: TextFormField(
          textInputAction: TextInputAction.done,
          onTapOutside: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: controller,
          obscureText: obsecureText,
          cursorColor: kPrimary,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kBlack,
              ),
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: kBlack, width: 0.2),
                  borderRadius: BorderRadius.all(Radius.zero)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kBlack, width: 0.2),
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kBlack),
                borderRadius: BorderRadius.all(Radius.zero),
              )),
        ));
  }
}
