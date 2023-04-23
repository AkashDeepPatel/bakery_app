import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends BaseController {
  Rx<TextEditingController> feedbackCtr = TextEditingController().obs;

  submitFeedback() async {
    change(null, status: RxStatus.loading());
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance.collection('feedbacks').add({
          "uid": user.uid,
          "name": user.phoneNumber,
          "message": feedbackCtr.value.text
        });
      }
      change(null, status: RxStatus.success());
      Get.back();
    } catch (e) {
      change(null, status: RxStatus.error());
      Get.snackbar("Error", "error");
    }
  }
}
