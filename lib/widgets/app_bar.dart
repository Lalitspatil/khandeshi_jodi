import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';

class CommanAppBar extends StatelessWidget {
  final String? text;
  final Color? color;
  final bool isBackButon;
  final bool isLogoutIconShow;
  final VoidCallback? onLogout;

  const CommanAppBar({
    super.key,
    this.text,
    this.isBackButon = false,
    this.color,
    this.isLogoutIconShow = false,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: Sizes.s35,

      /// BACK BUTTON
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

      /// TITLE
      title: TextView(
        text: text,
        size: FontSizes.s20,
        fontWeight: FontWeight.w600,
        color: color ?? CColors.black,
      ),

      /// LOGOUT ICON
      actions: [
        if (isLogoutIconShow)
          IconButton(
            onPressed: onLogout,
            icon: Icon(
              Icons.logout,
              color: color ?? CColors.black,
              size: Sizes.s25,
            ),
          ),
      ],

      elevation: 1,
      centerTitle: false,
    );
  }
}