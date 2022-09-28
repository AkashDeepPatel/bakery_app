import 'package:bakery_app/common/utils/common_assets.dart';
import 'package:bakery_app/walkthrough/screens/walkthrough_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/utils/common_assets.dart';

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
      Get.toNamed(WalkThroughScreens.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: SvgPicture.asset(CommonAssets.logo)));
  }
}
