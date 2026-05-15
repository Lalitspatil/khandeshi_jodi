import 'package:khandeshi_jodi/navigation/navigation_controller.dart';
import 'package:khandeshi_jodi/pages/home/home_controller.dart';
import 'package:khandeshi_jodi/pages/login/login_controller.dart';
import 'package:khandeshi_jodi/pages/profile/make_profile_controller.dart';
import 'package:khandeshi_jodi/resources/base_model.dart';
import 'package:khandeshi_jodi/services/login_services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class Providers{
  static List<SingleChildWidget> providerList = [
       ChangeNotifierProvider(create: (_) => BaseModel()),
       ChangeNotifierProvider(create: (_) => NavigationController()),
       //ChangeNotifierProvider(create: (_) => SplashController()..init('splash')),
       ChangeNotifierProvider(create: (_) => LoginController()..init('login')),
       ChangeNotifierProvider(create: (_) => HomeController()..init('home')),
       ChangeNotifierProvider(create: (_) => LoginServices(),),
       ChangeNotifierProvider(create: (_) => MakeProfileController()..init('profile')),


  ];
}