import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';

class CardButton extends StatelessWidget {

  final void Function()? onTap;
  final IconData icon;
  final String? text;
  final Color? bgColor;

  const CardButton({
    super.key,
    this.onTap,
    required this.icon,
    this.text,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: EdgeInsets.all(Sizes.s8),
        decoration: BoxDecoration(
          color: bgColor ?? CColors.themeBg,
          border: Border.all(color: CColors.grey,),
          borderRadius: BorderRadius.circular(
            DeviceRadius.s10,
          ),
        ),

        child: SizedBox(
          width: DeviceHeight.s68,
          child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              Icon(
                icon,
                size: Sizes.s16,
                color: CColors.white,
              ),
          
              SizedBox(width: DeviceWidth.s5),
          
              TextView(
                text: text,
                color: CColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}