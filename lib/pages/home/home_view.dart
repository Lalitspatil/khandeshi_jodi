import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:khandeshi_jodi/navigation/routes.dart';
import 'package:khandeshi_jodi/widgets/text_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    return Scaffold(
      body: Center(
        child: AppButton(
          text: "Logout",
          onPressed: () async {
            await auth.signOut();
            await googleSignIn.signOut();

          Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.login,
          (route) => false,
        );
          },
        ),
      ),
    );
  }
}