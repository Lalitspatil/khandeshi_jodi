import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/widgets/text_button.dart';

class UploadBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const UploadBox({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Sizes.s20,
        horizontal: Sizes.s15,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(Sizes.s10),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            size: 40,
          ),

          SizedBox(height: DeviceHeight.s10),

          // TextView(
          //   text: title,
          //   textAlign: TextAlign.center,
          // ),

          SizedBox(height: DeviceHeight.s10),

          AppButton(
            text: title,
            onPressed: onTap,
            textColor: CColors.themeBg,
            backgroundColor: Colors.white,
          ),

        ],
      ),
    );
  }
}