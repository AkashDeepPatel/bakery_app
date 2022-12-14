import 'package:bakery_app/authentication/controllers/authentication_controller.dart';
import 'package:bakery_app/authentication/screens/login_screen.dart';
import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  CreateAccountScreen({Key? key}) : super(key: key);
  static const String routeName = "/auth/createAccount";
  final AuthenticationController _authenticationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showBottomWidget: true,
      bottomWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextButton(
            text: "Continue to Get OTP",
            onTap: () {
              _authenticationController.firebasePhoneSignIn();
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
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VSpace(80),
            Column(
              children: [
                Text(
                  "Welcome, Please Enter the details to create an account with us.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const VSpace(60),
                AppTextField(
                  title: "Full Name",
                  hintText: "Olive Yew",
                  controller: _authenticationController.nameCtr,
                ),
                const VSpace(20),
                AppTextField(
                  title: "Phone Number",
                  hintText: "+911234657890",
                  controller: _authenticationController.phoneNumberCtr,
                ),
                const VSpace(20),
                AppTextField(
                  title: "Email",
                  hintText: "example@gmail.com",
                  controller: _authenticationController.emailCtr,
                ),
                const VSpace(15),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
