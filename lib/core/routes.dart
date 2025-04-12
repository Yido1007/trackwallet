import 'package:get/get.dart';
import 'package:trackwallet/home.dart';
import 'package:trackwallet/module/home/home_binding.dart';
import 'package:trackwallet/module/login/login_binding.dart';
import 'package:trackwallet/module/splash/splash_binding.dart';
import 'package:trackwallet/screen/client/login.dart';
import 'package:trackwallet/screen/client/splash.dart';

abstract class AppRoute {
  static const initial = splash;
  static const splash = "/splash";
  static const home = "/home";
  static const login = "/login";
  static const profile = "/profile";
}

class AppScreen {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoute.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoute.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoute.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
