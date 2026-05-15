import 'package:common_widgets/utils/custom_fontsize.dart';
import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/enums.dart';

class TextStyles {
  static TextStyle hintStyle = TextStyle(fontFamily: poppins,fontSize: CustomFontSize.s13,color: CColors.dullText,fontWeight: FontWeight.w300);
}

class BoxShadows {
  static BoxShadow get upperShadow => const BoxShadow(  color: Colors.black26, offset: Offset(0, -2), blurRadius: 6);
}
