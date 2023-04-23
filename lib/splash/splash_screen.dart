import 'package:bakery_app/common/utils/common_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../authentication/screens/auth_gate.dart';
import '../common/styles/app_themes.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AuthGate.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppThemes.white,
        body: Center(child: SvgPicture.asset(CommonAssets.logo)));
    // body: Center(
    //   child: Image.asset("assets/common/logo-no-background.png"),
    // ));
  }
}
