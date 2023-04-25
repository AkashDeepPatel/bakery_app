import 'package:bakery_app/authentication/screens/login_screen.dart';
import 'package:bakery_app/common/localization/localization.g.dart';
import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../authentication/screens/create_account_scren.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = "/welcomeScreen";

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showBottomWidget: true,
      bottomWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextButton(
            // text: "Create Account",
            text: Localization.welcomeCreateAccount.tr,
            color: AppThemes.primary,
            textColor: AppThemes.black,
            onTap: () {
              Get.toNamed(CreateAccountScreen.routeName);
            },
          ),
          const VSpace(20),
          AppTextButton(
            // text: "Log In",
            text: Localization.welcomeLogIn.tr,
            onTap: () {
              Get.toNamed(LoginScreen.routeName);
            },
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 52.0, right: 52.0),
              child: Column(
                children: [
                  Text(
                    // "Welcome to the Crown Bakery!",
                    Localization.welcomeTitle.tr,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const VSpace(15),
                  Text(
                    // "Enjoy the delicious cakes and more every day!",
                    Localization.welcomeSubTitle.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Spacer(),
            SvgPicture.asset(CommonAssets.logo),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
