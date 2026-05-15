import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';


class CommanAppBar extends StatelessWidget {

   String? text;
   Color? color;
   final bool isBackButon;

   CommanAppBar({super.key,this.text,this.isBackButon=false,this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: Sizes.s35,
        leading: isBackButon
          ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.s10),
                child: Icon(
                  Icons.arrow_back,
                  color: CColors.black,
                  size: Sizes.s30,
                ),
              ),
            )
          : null,
        title: TextView(text: text, size: FontSizes.s20,
        fontWeight: FontWeight.w600,color: color ?? CColors.black),
        elevation: 1,
        centerTitle: false,
      );
  }
}