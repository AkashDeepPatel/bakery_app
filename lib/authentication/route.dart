import 'package:bakery_app/authentication/screens/auth_gate.dart';
import 'package:bakery_app/authentication/screens/create_account_scren.dart';
import 'package:get/get.dart';
import '../walkthrough/screens/walkthrough_screens.dart';
import '../welcome_screen/screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/otp_verification_screen.dart';

class AuthRoutes {
  AuthRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const AuthGate()),
    GetPage(name: '/createAccount', page: () => CreateAccountScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/otpVerification', page: () => OTPVerificationScreen()),
  ];
}
