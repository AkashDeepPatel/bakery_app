import 'package:bakery_app/authentication/screens/login_screen.dart';
import 'package:bakery_app/walkthrough/screens/walkthrough_screens.dart';
import 'package:bakery_app/welcome_screen/screens/welcome_screen.dart';
import 'package:get/get.dart';
import '../authentication/screens/create_account_scren.dart';
import '../authentication/screens/otp_verification_screen.dart';
import '../dashboard/bindings/dashboard_bindings.dart';
import '../dashboard/screens/dashboard_screen.dart';
import '../splash/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/walkthrough', page: () => WalkThroughScreens()),
    GetPage(name: '/welcomeScreen', page: () => const WelcomeScreen()),
    GetPage(name: '/createAccount', page: () => CreateAccountScreen()),
    GetPage(name: '/otpVerification', page: () => OTPVerificationScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(
        name: '/dashboard',
        page: () => DashboardScreen(),
        binding: DashboardBindings()),
  ];
}
