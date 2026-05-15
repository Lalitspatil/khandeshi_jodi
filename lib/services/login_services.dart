import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginServices extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _verificationId;

  /// 📱 SEND OTP
  Future<void> sendOtp({
    required String phone,
    required Function(String) codeSent,
    required Function(String) onError,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      //
      timeout: const Duration(seconds: 60), 
      
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto login (rare case)
       // await _auth.signInWithCredential(credential);
      },

      verificationFailed: (FirebaseAuthException e) {
        onError(e.message ?? "Verification Failed");
      },

      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;

        codeSent(verificationId);
      },

      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  /// 🔐 VERIFY OTP
  Future<User?> verifyOtp(String otp) async {

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: otp,
    );

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    return userCredential.user;
  }

Future<void> saveUserToFirestore(User user) async {
  final userDoc = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid);

  final docSnapshot = await userDoc.get();

  // 👉 अगर user पहले से exist नहीं करता
  if (!docSnapshot.exists) {
    await userDoc.set({
      'uid': user.uid,
      'phone': user.phoneNumber,
      'createdAt': DateTime.now(),
    });
  }
}

  /// 🔵 GOOGLE LOGIN
  Future<User?> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn();

    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential result =
        await _auth.signInWithCredential(credential);

    return result.user;
  }

  /// 🚪 LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}