import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/widgets/text_field.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';

class CommonFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int? maxLines;

  const CommonFormField({
    super.key,
    required this.text,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(text: text),

        SizedBox(height: DeviceHeight.s10),

        AppTextField(
          controller: controller,
          hintText: hintText,
          keyboardType: keyboardType,
          maxLines: maxLines,
        ),
      ],
    );
  }
}