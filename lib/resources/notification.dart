import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/enums.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';
import 'package:toastification/toastification.dart';

enum SnackBarStatus { success, error, warning }

void showSnackBar(String? message, BuildContext context, HttpStatusCode? status,
    {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: status?.name == HttpStatusCode.success.name
          ? CColors.green
          : status?.name == HttpStatusCode.error.name
              ? CColors.red
              : CColors.lightYellow,
      content: TextView(
          text: message ?? '',
          color: color ?? CColors.white,
          textAlign: TextAlign.center)));
}

void showToast(
    {String? message,
    Color? color,
    HttpStatusCode? status = HttpStatusCode.success}) {
  toastification.show(
      description: Flexible(
        child: TextView(
            text: message ?? '',
            color:  color ?? CColors.textGrey,
            textAlign: TextAlign.center),
      ),
      style: ToastificationStyle.flatColored,
      type: status == HttpStatusCode.success
          ? ToastificationType.success
          : status == HttpStatusCode.error
              ? ToastificationType.error
              : ToastificationType.warning,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 5));
}
