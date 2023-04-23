import 'package:bakery_app/authentication/controllers/authentication_controller.dart';
import 'package:bakery_app/authentication/screens/login_screen.dart';
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
            // text: "Continue to Get OTP",
            text: Localization.createAccountOTP.tr,
            onTap: () {
              _authenticationController.firebasePhoneSignIn();

            },
          ),
          const VSpace(24),
          RichText(
            text: TextSpan(
                // text: "Already a member? ",
                text: Localization.createAccountMember.tr,
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                      // text: "Log In",
                      text: Localization.welcomeLogIn.tr,
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
                  // "Welcome, Please Enter the details to create an account with us.",
                  Localization.createAccountTitle.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const VSpace(60),
                AppTextField(
                  // title: "Full Name",
                  title: Localization.createAccountFullName.tr,
                  // hintText: "Olive Yew",
                  hintText: Localization.createAccountFullNameHint.tr,
                  controller: _authenticationController.nameCtr,
                ),
                const VSpace(20),
                AppTextField(
                  // title: "Phone Number",
                  title: Localization.createAccountPhoneNum.tr,
                  // hintText: "+911234657890",
                  hintText: Localization.createAccountPhoneNumHint.tr,
                  controller: _authenticationController.phoneNumberCtr,
                  textInputType: TextInputType.phone,
                ),
                const VSpace(20),
                AppTextField(
                  // title: "Email",
                  title: Localization.createAccountEmail.tr,
                  // hintText: "example@gmail.com",
                  hintText: Localization.createAccountEmailHint.tr,
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
