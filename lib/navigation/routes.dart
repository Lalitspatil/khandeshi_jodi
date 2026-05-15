
import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/pages/home/home_view.dart';
import 'package:khandeshi_jodi/pages/login/login_view.dart';
import 'package:khandeshi_jodi/pages/profile/make_profile_view.dart';
import 'package:khandeshi_jodi/pages/splash/splash_view.dart';
import 'package:page_transition/page_transition.dart';



class Routes {
  static String? currentRoute;
  
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const makeProfile = '/makeProfile';


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    currentRoute = settings.name;
    switch (settings.name) {
      case splash:
        return PageTransition(
            child: const SplashView(),
            type: PageTransitionType.fade,
            settings: settings);

      case login:
        return PageTransition(
            child: const LoginView(),
            type: PageTransitionType.fade,
            settings: settings);

      case home:
        return PageTransition(
            child: const HomeView(),
            type: PageTransitionType.fade,
            settings: settings);

      case makeProfile:
        return PageTransition(
            child: const MakeProfileView(),
            type: PageTransitionType.fade,
            settings: settings);

     
      default:
        return PageTransition( 
            child: const SplashView(),
            childCurrent: const LoginView(),
            type: PageTransitionType.topToBottomJoined,
            settings: settings,
          );
    }
  }
}