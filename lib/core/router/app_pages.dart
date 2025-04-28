import 'package:get/get.dart';
import 'package:kopa_project/module/home_page/screen/home_page_screen.dart';
import 'package:kopa_project/module/login_page/screen/login_page_screen.dart';
import 'package:kopa_project/module/login_page/screen/login_page_screen_two.dart';
import 'package:kopa_project/module/profile/screen/profile_screen.dart';
import 'package:kopa_project/module/splash_screen/screen/splash_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginPageScreen()),
    GetPage(name: AppRoutes.loginTwo, page: () => const LoginPageScreenTwo()),
    GetPage(name: AppRoutes.home, page: () => const HomePageScreen()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
  ];
}