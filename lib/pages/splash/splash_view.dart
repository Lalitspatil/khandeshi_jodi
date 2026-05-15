import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/assets.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/pages/splash/splash_controller.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late SplashController splashController;

  @override
  void initState() {
    super.initState();
    splashController = SplashController(tickerProvider: this,context: context,);
  }

  @override
  void dispose() {
    splashController.disposeAnimations();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: splashController,
      child: Consumer<SplashController>(
        builder: (_, controller, __) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xFFE94057), // ❤️ Red
                //     Color(0xFFF27121), // 🔥 Orange
                //   ],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // ❤️ Floating wedding icons
                  AnimatedBuilder(
                    animation: controller.iconsAnimation,
                    builder: (_, child) {
                      return Stack(
                        children: [
                          Positioned(
                            top: DeviceHeight.s100 - controller.iconsAnimation.value,
                            right: DeviceWidth.s50,
                            child: TextView(text: '',),
                          ),
                          Positioned(
                            top: DeviceHeight.s100 - controller.iconsAnimation.value,
                            left: DeviceWidth.s50,
                            child: TextView(text: '',),
                          ),
                          
                        ],
                      );
                    },
                  ),

                  // 💍 Logo + App Name
                  FadeTransition(
                    opacity: controller.logoAnimation,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Assets.logo, // 👉 apna shadi logo lagana
                          width: DeviceWidth.s200,
                          height: DeviceHeight.s200,
                        ),
                      //  SizedBox(height: DeviceHeight.s20),

                        // App Name
                        Text(
                          "Khandeshi💍Sadi",
                          style: TextStyle(
                            color: Color(0xFFF27121),
                            fontSize: FontSizes.s28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: DeviceHeight.s8),

                        // Tagline (Marathi + Hindi mix)
                        Text(
                          "खानदेशचे सर्वात विश्वसनीय विवाह व्यासपीठ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFF27121),
                            fontSize: FontSizes.s16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}