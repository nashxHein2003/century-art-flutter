import 'package:century_art_flutter/core/presentation/theme/app_theme.dart';
import 'package:century_art_flutter/core/presentation/widgets/form_text_field_set_widget.dart';
import 'package:flutter/material.dart';

class SubmissionWidget extends StatefulWidget {
  const SubmissionWidget({super.key});

  @override
  State<SubmissionWidget> createState() => _SubmissionWidgetState();
}

class _SubmissionWidgetState extends State<SubmissionWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                spacing: 20,
                children: [
                  FormTextFieldSetWidget(
                    label: 'Title',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: kWhite),
                  ),
                  FormTextFieldSetWidget(
                    label: 'Tags',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: kWhite),
                  ),
                  FormTextFieldSetWidget(
                    label: 'Description',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: kWhite),
                  ),
                  const Row(
                    children: [],
                  )
                ],
              ),
            )),
            const Expanded(child: SizedBox())
          ],
        )
      ],
    ));
  }
}
