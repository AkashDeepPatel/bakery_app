import 'package:get/get.dart';
import '../home/home_screen.dart';

import '../splash/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
  ];
}
