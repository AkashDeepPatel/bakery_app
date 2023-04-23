import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Rx<TextEditingController> username = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> phoneNo = TextEditingController().obs;

  getUser() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      username.value.text = documentSnapshot.get('fullName');
      email.value.text = documentSnapshot.get('email');
      phoneNo.value.text = documentSnapshot.get('phone');
    }
  }
}
