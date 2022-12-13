import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  updateVerificationId(String id) {
    _verificationId.value = id;
  }

  firebasePhoneSignIn() {
    // change(null, status: RxStatus.loadingMore());
    String phoneNumber = phoneNumberCtr.text;

    void verificationCompleted(AuthCredential phoneAuthCredential) {
      debugPrint(phoneAuthCredential.toString());
    }

    void verificationFailed(FirebaseAuthException error) {
      change(null, status: RxStatus.success());
      // SnackBarMessageWidget.show(error.message.toString());
      debugPrint("hell");
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
        FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .set({
          "uid": auth.currentUser?.uid,
          "phone": phoneNumberCtr.text,
          "fullName": nameCtr.text,
          "email": emailCtr.text,
        });
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
      resetData();
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
}
