import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:khandeshi_jodi/resources/assets.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/widgets/text_button.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';
import 'package:provider/provider.dart';
import 'package:khandeshi_jodi/pages/login/login_controller.dart';

class OtpView extends StatelessWidget {
  final String phone;

  const OtpView({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
      builder: (_, vm, __) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("OTP Verification"),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
            horizontal: Sizes.s20, vertical: Sizes.s20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: DeviceHeight.s180,
                    width: DeviceWidth.s180,
                    child: Image.asset(Assets.logo),
                  ),

                  TextView(
                    text: vm.getValue('tittle'),
                    size: Sizes.s28,
                    fontWeight: FontWeight.bold,
                  ),

                  SizedBox(height: DeviceHeight.s8),

                  TextView(
                    text: vm.getValue('mini_tittle'),
                    color: CColors.textGrey,
                  ),

                  SizedBox(height: DeviceHeight.s30),

                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(
                        text: vm.getValue("otp_send_to"),
                      ),
                      SizedBox(width: DeviceWidth.s5,),
                      TextView(text: phone,)
                    ],
                  ),

                  SizedBox(height: DeviceHeight.s20),

                  OtpTextField(
                    numberOfFields: 6,
                    focusedBorderColor: CColors.red,
                    showFieldAsBox: true,
                    borderRadius: BorderRadius.circular(10),
                    onSubmit: (String code) {
                      vm.verifyOtp(context, code);
                    },
                    onCodeChanged: (String code) {
                      vm.otpController.text = code;
                    },
                  ),

                  SizedBox(height: DeviceHeight.s20),

                  GestureDetector(
                    onTap: () {
                      vm.sendOtp(context);
                    },
                    child: TextView(
                      text: 'Resend OTP',
                      color: CColors.red,
                      isbold: true,
                    ),
                  ),

                  SizedBox(height: DeviceHeight.s30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: AppButton(
                      backgroundColor: CColors.themeBg,
                      text: vm.isLoading
                          ? vm.getValue('loading')
                          : vm.getValue('verify_otp'),
                      onPressed: vm.isLoading
                          ? null
                          : () {
                              vm.verifyOtp(
                                context,
                                vm.otpController.text.trim(),
                              );
                            },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}