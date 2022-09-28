import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/widgets/app_text_button.dart';
import '../../common/widgets/app_text_field.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import 'login_screen.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);
  static const String routeName = "/otpVerification";

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Bakery App",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Column(
              children: [
                Text(
                  "An Otp has been sent to the number +91-456782344",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const VSpace(15),
                AppTextField(
                  title: "OTP",
                ),
                const VSpace(15),
                RichText(
                  text: TextSpan(
                      text: "Didn't receive OTP? ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: "Resend Again",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppThemes.primary))
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: "Get OTP via Call",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppThemes.primary)),
                ),
              ],
            ),
            Column(
              children: [
                AppTextButton(
                  text: "Continue",
                  onTap: () {
                    Get.toNamed(DashboardScreen.routeName);
                  },
                ),
                const VSpace(24),
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
