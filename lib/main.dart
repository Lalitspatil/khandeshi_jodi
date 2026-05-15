import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khandeshi_jodi/navigation/provider.dart';
import 'package:khandeshi_jodi/navigation/routes.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/constants.dart';
import 'package:khandeshi_jodi/pages/splash/splash_view.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.setSettings(
    appVerificationDisabledForTesting: true,
  );
  runApp(
      MultiProvider(providers: Providers.providerList, child: const Splash()));
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: false,
      designSize: const Size(360, 690),
      builder: (_, child) {
        return ToastificationWrapper(
          child: MaterialApp(
            title: appName,
            theme: ThemeData(
              scaffoldBackgroundColor: CColors.white,
              appBarTheme: const AppBarTheme(
                  backgroundColor: CColors.white, shadowColor: CColors.white),
              bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: Colors.black.withOpacity(0)),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: Routes.onGenerateRoute,
            home: const SplashView(),
          ),
        );
      },
    );

  }
}