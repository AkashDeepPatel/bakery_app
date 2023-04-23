import 'package:bakery_app/common/localization/localization.g.dart';
import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/widgets/app_dialog.dart';
import '../../common/widgets/app_text_button.dart';
import '../../common/widgets/app_text_field.dart';
import '../controllers/authentication_controller.dart';
import 'otp_verification_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "/auth/login";
  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showBottomWidget: true,
      bottomWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextButton(
            // text: "Continue to Get OTP",
            text: Localization.createAccountOTP.tr,
            onTap: () {
              _authenticationController.firebasePhoneSignIn();

            },
          ),
          VSpace(24),
          RichText(
            text: TextSpan(
                // text: "Don't have Account? ",
                text: Localization.loginAccount.tr,
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                      // text: "Sign Up",
                      text: Localization.loginSignUp.tr,
                      // text: Localization,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppThemes.primary))
                ]),
          ),
        ],
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
            Text(
              // "Welcome Back!",
              Localization.loginTitle.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Column(
              children: [
                VSpace(15),
                AppTextField(
                  // title: "Phone Number",
                  title: Localization.createAccountPhoneNum.tr,
                  controller: _authenticationController.phoneNumberCtr,
                  textInputType: TextInputType.phone,

                ),
                VSpace(15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
