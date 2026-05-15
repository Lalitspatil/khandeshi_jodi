import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/navigation/routes.dart';

class SplashController extends ChangeNotifier {
  final TickerProvider tickerProvider;
  final BuildContext context;

  late AnimationController logoController;
  late Animation<double> logoAnimation;

  late AnimationController iconsController;
  late Animation<double> iconsAnimation;

  SplashController({
    required this.tickerProvider,
    required this.context,
  }) {
    initAnimations();
    startSplashTimer();
  }

  void initAnimations() {
    logoController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(seconds: 2),
    );

    logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.easeInOut),
    );

    logoController.forward();

    iconsController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    iconsAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: iconsController, curve: Curves.easeInOut),
    );
  }

  void startSplashTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Navigator.pushReplacementNamed(context, Routes.home);
      } else {
        Navigator.pushReplacementNamed(context, Routes.login);
      }
    });
  }

  void disposeAnimations() {
    logoController.dispose();
    iconsController.dispose();
  }
}