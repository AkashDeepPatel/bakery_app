import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/widgets/app_dialog.dart';
import '../../common/widgets/app_text_button.dart';
import '../../common/widgets/app_text_field.dart';
import 'otp_verification_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Bakery App",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Column(
              children: [
                VSpace(15),
                AppTextField(
                  title: "Phone Number",
                ),
                VSpace(15),
                AppTextField(
                  title: "Email",
                ),
                VSpace(15),
              ],
            ),
            Column(
              children: [
                AppTextButton(
                  text: "Continue to Get OTP",
                  onTap: () {
                    Get.dialog(AppDialog(
                      message:
                          "You will receive 4 digit code on your given phone number.",
                      buttonTitle: "Okay",
                      onButtonTap: () {
                        Get.back();
                        Get.toNamed(OTPVerificationScreen.routeName);
                      },
                    ));
                  },
                ),
                VSpace(24),
                RichText(
                  text: TextSpan(
                      text: "Don't have Account? ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppThemes.primary))
                      ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
