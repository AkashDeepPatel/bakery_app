import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/widgets/app_text_button.dart';
import '../../common/widgets/app_text_field.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../controllers/authentication_controller.dart';
import 'login_screen.dart';

class OTPVerificationScreen extends StatelessWidget {
  OTPVerificationScreen({Key? key}) : super(key: key);
  static const String routeName = "/auth/otpVerification";
  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showBottomWidget: true,
      bottomWidget: AppTextButton(
        text: "Continue",
        onTap: () {
          _authenticationController.submitOTP();
          Get.toNamed(DashboardScreen.routeName);
        },
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text(
            //   "Bakery App",
            //   style: Theme.of(context).textTheme.headlineSmall,
            // ),
            Column(
              children: [
                Text(
                  "An Otp has been sent to the number ${_authenticationController.phoneNumberCtr.value.text}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const VSpace(80),
                AppTextField(
                  title: "Enter OTP",
                  controller: _authenticationController.otpCtr,
                ),
                const VSpace(15),
                RichText(
                  text: TextSpan(
                      text: "Didn't receive OTP? ",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppThemes.subtleLight),
                      children: [
                        TextSpan(
                            text: "Resend Again",
                            style: Theme.of(context).textTheme.labelMedium)
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: "Get OTP via Call",
                      style: Theme.of(context).textTheme.labelMedium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
