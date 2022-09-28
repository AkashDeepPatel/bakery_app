import 'package:bakery_app/authentication/screens/login_screen.dart';
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

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);
  static const String routeName = "/createAccount";

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Welcome, Please Enter the details to create an account with us.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                VSpace(48),
                AppTextField(
                  title: "Name",
                ),
                VSpace(20),
                AppTextField(
                  title: "Phone Number",
                ),
                VSpace(20),
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
                      text: "Already a member? ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: "Log In",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppThemes.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(LoginScreen.routeName);
                              })
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
