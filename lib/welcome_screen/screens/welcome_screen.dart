import 'package:bakery_app/authentication/screens/login_screen.dart';
import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../authentication/screens/create_account_scren.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = "/welcomeScreen";

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Welcome to the Crown Bakery",
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                VSpace(15),
                Text(
                  "Enjoy the delicious cakes and more every day!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            SvgPicture.asset(CommonAssets.logo),
            Column(
              children: [
                AppTextButton(
                  text: "Create Account",
                  onTap: () {
                    Get.toNamed(CreateAccountScreen.routeName);
                  },
                ),
                VSpace(20),
                AppTextButton(
                  text: "Log In",
                  onTap: () {
                    Get.toNamed(LoginScreen.routeName);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
