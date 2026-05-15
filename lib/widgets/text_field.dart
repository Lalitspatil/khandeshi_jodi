import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/colors.dart';


class AppTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;
  TextStyle? hintStyle;
  String? Function(String?)? validators;
  bool obscureText;
  Widget? suffixIcon;
  TextAlign? textAlign;
  Widget? prefixIcon;
  TextInputType? keyboardType;
  int? maxLines;


  AppTextField({
    super.key,
    this.controller,
    this.hintStyle,
    this.hintText,
    this.validators,
    this.obscureText = false,
    this.suffixIcon,
    this.textAlign,
    this.prefixIcon,
    this.keyboardType,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(controller: controller,
          decoration: InputDecoration(
            border:  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: hintText,
            hintStyle: hintStyle ??  TextStyle(color: CColors.textGrey),
            suffixIcon:suffixIcon,
            prefixIcon: prefixIcon,
          ),
          maxLines: maxLines,
          keyboardType: keyboardType,
          textAlign: textAlign ?? TextAlign.start,
          obscureText: obscureText,
          validator: validators),
    );
  }
}
  