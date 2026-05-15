import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';

class CommonGenderTile extends StatelessWidget {
  final String value;
  final String title;
  final String groupValue;
  final Function(String) onChanged;

  const CommonGenderTile({
    super.key,
    required this.value,
    required this.title,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: CColors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: RadioListTile<String>(
          value: value,
          groupValue: groupValue,
          activeColor: CColors.themeBg,
          title: TextView(text: title),
          onChanged: (value) {
            onChanged(value!);
          },
        ),
      ),
    );
  }
}