import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/navigation/base_scaffold.dart';
import 'package:khandeshi_jodi/pages/login/login_controller.dart';
import 'package:khandeshi_jodi/resources/assets.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/resources/validators.dart';
import 'package:khandeshi_jodi/widgets/text_button.dart';
import 'package:khandeshi_jodi/widgets/text_field.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
      builder: (_, vm, __) {
        return BaseScaffold(
          currentIndex: 0,
          body: Form(
            key: vm.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.s20,vertical: Sizes.s30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                
                    SizedBox(height: DeviceHeight.s60),
                
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(text: vm.getValue('mob_number'),),
                        SizedBox(height: DeviceHeight.s10),
                
                        AppTextField(
                          controller: vm.phoneController,
                          hintText: vm.getValue('enter_number'),
                          prefixIcon: const Icon(Icons.call),
                          keyboardType: TextInputType.numberWithOptions(),
                          validators: (value) =>
                              vm.phoneController.isNumeric(),
                        ),
                      ],
                    ),
                
                    SizedBox(height: DeviceHeight.s20),
                
                    SizedBox(
                      width: double.infinity,
                      height: DeviceHeight.s50,
                      child: AppButton(
                        text: vm.isLoading
                            ? vm.getValue('sending')
                            : vm.getValue('send_otp'),
                        backgroundColor: CColors.themeBg,
                        onPressed: () {
                          vm.sendOtp(context);
                        },
                      ),
                    ),
                
                    SizedBox(height: DeviceHeight.s20),
                
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Sizes.s10),
                          child: TextView(text: vm.getValue('or')),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                
                    SizedBox(height: DeviceHeight.s20),
                
                    SizedBox(
                      width: double.infinity,
                      height: DeviceHeight.s50,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          vm.loginWithGoogle(context);
                        },
                        icon: Icon(Icons.login, color: CColors.red),
                        label: TextView(text: vm.getValue('goagle')),
                      ),
                    ),
                
                    SizedBox(height: DeviceHeight.s20),

                    GestureDetector(
                      onTap: () {
                        vm.didTapSkip(context);
                      },
                      child: TextView(
                        text: vm.getValue('skip'),
                        isbold: true,
                        size: Sizes.s15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}