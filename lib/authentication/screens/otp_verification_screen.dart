import 'package:bakery_app/common/localization/localization.g.dart';
import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/widgets/app_text_button.dart';
import '../controllers/authentication_controller.dart';

class OTPVerificationScreen extends StatelessWidget {
  OTPVerificationScreen({Key? key}) : super(key: key);
  static const String routeName = "/auth/otpVerification";
  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showBottomWidget: true,
      bottomWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AppTextButton(
          text: "Continue",
          onTap: () {
            debugPrint(_authenticationController.otpCtr.text);
            _authenticationController.submitOTP();
            // Get.toNamed(DashboardScreen.routeName);
          },
        ),
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
                  // "An Otp has been sent to the number ${_authenticationController.selectedCountryCode + _authenticationController.phoneNumberCtr.value.text}",
                  "${Localization.otpVerificationOTPsent.tr} ${_authenticationController.selectedCountryCode + _authenticationController.phoneNumberCtr.value.text}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const VSpace(80),
                PinInputTextField(
                  autoFocus: true,
                  controller: _authenticationController.otpCtr,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\d*')),
                  ],
                  cursor: Cursor(color: Colors.black,width: 50,height: 50),
                  // decoration: BoxLooseDecoration(
                  //     bgColorBuilder: FixedColorBuilder(Theme.of(context).scaffoldBackgroundColor),
                  //     strokeColorBuilder: FixedColorBuilder(Theme.of(context).indicatorColor)),
                  decoration: UnderlineDecoration(
                    bgColorBuilder: FixedColorBuilder(Theme.of(context).backgroundColor),
                      colorBuilder: FixedColorBuilder(
                          Theme.of(context).primaryColor),
                      textStyle: Theme.of(context).textTheme.headlineMedium),
                ),
                VSpace(80),
                // Obx(() => _authenticationController.isShowTimer.value == false
                //     ? RichText(
                //   text: TextSpan(
                //     // text: "Didn't receive the OTP? ",
                //     text: Localization.otpVerificationDontReceiveOTP.tr,
                //     style: Theme.of(context).textTheme.bodyLarge,
                //     children: <TextSpan>[
                //       TextSpan(
                //           // text: "Resend OTP",
                //           text: Localization.otpVerificationResendOTP.tr,
                //           style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).primaryColor),
                //           recognizer: TapGestureRecognizer()..onTap = () => _authenticationController.firebasePhoneSignIn()
                //       ),
                //     ],
                //   ),
                // )
                //     : Text(
                //   _authenticationController.otpWaitTimeLabel.value,
                //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).primaryColor),
                // )),
                RichText(
                  text: TextSpan(
                    // text: "Didn't receive the OTP? ",
                    text: Localization.otpVerificationDontReceiveOTP.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: <TextSpan>[
                      TextSpan(
                        // text: "Resend OTP",
                          text: Localization.otpVerificationResendOTP.tr,
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()..onTap = () => _authenticationController.firebasePhoneSignIn()
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
