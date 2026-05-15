import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/navigation/routes.dart';
import 'package:khandeshi_jodi/pages/login/otp_view.dart';
import 'package:khandeshi_jodi/resources/base_model.dart';
import 'package:khandeshi_jodi/services/login_services.dart';
import 'package:provider/provider.dart';

class LoginController extends BaseModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  /// 📱 SEND OTP
  void sendOtp(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    String phone = phoneController.text.trim();

    if (!phone.startsWith('+91')) {
      phone = '+91$phone';
    }

    setLoading(true);

    final service = context.read<LoginServices>();

    await service.sendOtp(
      phone: phone,

      codeSent: (verId) {
       setLoading(false);
     
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text("OTP Sent")),
       );
     
       Navigator.push(
         context,
         MaterialPageRoute(
           builder: (_) => OtpView(phone: phone),
         ),
       );
     },

      onError: (error) {
        setLoading(false);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
    );
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
  try {
    setLoading(true);
    
    final service = context.read<LoginServices>();
    final user = await service.verifyOtp(otp);


    if (user != null) {
      await service.saveUserToFirestore(user); 
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Success")),
      );
       
      setLoading(false);
      // 👉 HOME PAGE NAVIGATION
      Navigator.pushNamedAndRemoveUntil(
       context,
       Routes.makeProfile,
       (route) => false,
     );
    }
  } catch (e) {
    setLoading(false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Invalid OTP")),
    );
  }
}

  Future<void> loginWithGoogle(BuildContext context) async {
    try {
      setLoading(true);

      final service = context.read<LoginServices>();
      final user = await service.loginWithGoogle();

      setLoading(false);

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Google Login Success")),
        );
        Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.makeProfile,
        (route) => false,
      );
      }
    } catch (e) {
      setLoading(false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Error: $e")),
      );
    }
  }

  void didTapSkip(BuildContext context) {
     Navigator.of (context).pushNamed (Routes.home, arguments: {'context': context}) ;
 }

}