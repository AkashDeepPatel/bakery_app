import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../common/styles/app_themes.dart';
import '../countdown_base.dart';
import '../screens/auth_gate.dart';
import '../screens/otp_verification_screen.dart';

class AuthenticationController extends BaseController {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController phoneNumberCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController otpCtr = TextEditingController();
  RxString get verificationId => _verificationId;
  RxBool isRegister = false.obs;

  final RxString _verificationId = "".obs;

  final selectedCountryCode = "+91".obs;
  RxList<String> countryCodeList = ["+91", "+1", "+61"].obs;

  void setSelectedCountryCode(String value) {
    selectedCountryCode.value = value;
    // debugPrint(selectedCountryCode.value);
  }

  updateVerificationId(String id) {
    _verificationId.value = id;
  }

  firebasePhoneSignIn({bool login = true}) {
    // change(null, status: RxStatus.loadingMore());
    String phoneNumber = selectedCountryCode + phoneNumberCtr.text;

    if(!login){
      if (nameCtr.value.text.isNotEmpty &&
          phoneNumberCtr.value.text.isNotEmpty &&
          emailCtr.value.text.isNotEmpty) {
        if (phoneNumber.isNotEmpty && phoneNumber.length > 9) {
          void verificationCompleted(AuthCredential phoneAuthCredential) {
            debugPrint(phoneAuthCredential.toString());
          }

          void verificationFailed(FirebaseAuthException error) {
            change(null, status: RxStatus.success());
            // SnackBarMessageWidget.show(error.message.toString());
          }

          void codeSent(String verificationId, int? code) {
            updateVerificationId(verificationId);
            change(null, status: RxStatus.success());
            Get.toNamed(OTPVerificationScreen.routeName);
          }

          void codeAutoRetrievalTimeout(String verificationId) {
            updateVerificationId(verificationId);
            change(null, status: RxStatus.success());
          }

          FirebaseAuth auth = FirebaseAuth.instance;
          auth.verifyPhoneNumber(
            phoneNumber: phoneNumber,
            timeout: const Duration(milliseconds: 10000),
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          );
          Get.toNamed(OTPVerificationScreen.routeName);
          // Get.dialog(AppDialog(
          //   message:
          //   "You will a receive OTP on your given phone number.",
          //   buttonTitle: "Okay",
          //   onButtonTap: () {
          //     Get.back();
          //     Get.toNamed(OTPVerificationScreen.routeName);
          //   },
          // )
          // );
        } else {
          Get.snackbar("Please Enter a Valid Phone Number", "",
              backgroundColor: AppThemes.black);
        }
      } else {
        Get.snackbar("Please enter all the fields", "",
            backgroundColor: AppThemes.black);
      }
    }else{
      {
        if (phoneNumber.isNotEmpty && phoneNumber.length > 9) {
          void verificationCompleted(AuthCredential phoneAuthCredential) {
            debugPrint(phoneAuthCredential.toString());
          }

          void verificationFailed(FirebaseAuthException error) {
            change(null, status: RxStatus.success());
            // SnackBarMessageWidget.show(error.message.toString());
          }

          void codeSent(String verificationId, int? code) {
            updateVerificationId(verificationId);
            change(null, status: RxStatus.success());
            Get.toNamed(OTPVerificationScreen.routeName);
          }

          void codeAutoRetrievalTimeout(String verificationId) {
            updateVerificationId(verificationId);
            change(null, status: RxStatus.success());
          }

          FirebaseAuth auth = FirebaseAuth.instance;
          auth.verifyPhoneNumber(
            phoneNumber: phoneNumber,
            timeout: const Duration(milliseconds: 10000),
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          );
          Get.toNamed(OTPVerificationScreen.routeName);
          // Get.dialog(AppDialog(
          //   message:
          //   "You will a receive OTP on your given phone number.",
          //   buttonTitle: "Okay",
          //   onButtonTap: () {
          //     Get.back();
          //     Get.toNamed(OTPVerificationScreen.routeName);
          //   },
          // )
          // );
        } else {
          Get.snackbar("Please Enter a Valid Phone Number", "",
              backgroundColor: AppThemes.black);
        }
      }
    }
  }

  submitOTP() async {
    change(null, status: RxStatus.loading());
    debugPrint("${otpCtr.text}verId${verificationId.value}");
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otpCtr.text,
      );
      FirebaseAuth auth = FirebaseAuth.instance;
      final UserCredential userCredential =
          (await auth.signInWithCredential(credential));

      if (userCredential.additionalUserInfo!.isNewUser) {
        var user = FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
          "uid": auth.currentUser?.uid,
          "phone": phoneNumberCtr.text,
          "fullName": nameCtr.text,
          "email": emailCtr.text,
        });
        // user!.updateEmail(emailCtr.text);
        // user!.updateDisplayName(nameCtr.text);
      }
      // FirebaseFirestore.instance.collection('users').add({
      //   "uid": auth.currentUser?.uid,
      //   "phone": phoneNumberCtr.text,
      //   "fullName": nameCtr.text
      // });

      User? user = userCredential.user;

      String token = await user!.getIdToken(true);
      debugPrint("token:$token");
      final store = GetStorage();
      await store.write("token", token);
      // if (isRegister.value) {
      //   // createUserApi();
      //
      // } else {
      Get.offAllNamed(AuthGate.routeName);
      // }
      // resetData();
      return user;
    } on FirebaseAuthException catch (e) {
      // SnackBarMessageWidget.show(e.message.toString());
      change(null, status: RxStatus.error(e.message));
      debugPrint("Failed to sign in: $e");
    }
    return null;
  }

  resetData() {
    nameCtr.clear();
    emailCtr.clear();
    phoneNumberCtr.clear();
    otpCtr.clear();

    change(null, status: RxStatus.success());
  }

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  RxString otpWaitTimeLabel = "00:00".obs;
  CountDown? otpTimer;
  RxBool isShowTimer = true.obs;

  void startTimer() {
    otpTimer = CountDown(const Duration(minutes: 1));
    var sub = otpTimer!.stream.listen(null);
    sub.onData((Duration d) {
      int sec = d.inSeconds % 60;
      otpWaitTimeLabel(
          "${d.inMinutes.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}");
    });

    sub.onDone(() {
      isShowTimer(false);
      sub.cancel();
    });
  }

  void closeTimer() {
    if (otpTimer != null) {
      otpTimer!.onCancel();
    }
  }

  @override
  void dispose() {
    super.dispose();
    closeTimer();
    otpCtr.dispose();
  }
}
