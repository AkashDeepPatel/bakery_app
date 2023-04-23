import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends BaseController {
  RxInt defaultAddress = 0.obs;

  RxList userAddresses = [].obs;

  @override
  void onInit() {
    super.onInit();
    getUserAddress();
  }

  //fetching user saved addresses
  getUserAddress() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      userAddresses.value = documentSnapshot.get('addresses');
    }
  }

  //adding new user address
  Rx<TextEditingController> nameCtr = TextEditingController().obs;
  Rx<TextEditingController> phoneCtr = TextEditingController().obs;
  Rx<TextEditingController> flatNoCtr = TextEditingController().obs;
  Rx<TextEditingController> landmarkCtr = TextEditingController().obs;
  Rx<TextEditingController> areaCtr = TextEditingController().obs;
  Rx<TextEditingController> cityCtr = TextEditingController().obs;
  Rx<TextEditingController> pincodeCtr = TextEditingController().obs;
  RxBool isDefault = false.obs;

  addUserAddress() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var newUserAddress = {
        "name": nameCtr.value.text,
        "flatNo": flatNoCtr.value.text,
        "landmark": landmarkCtr.value.text,
        "area": areaCtr.value.text,
        "city": cityCtr.value.text,
        "pincode": pincodeCtr.value.text,
        "phoneNo": phoneCtr.value.text,
      };
      userAddresses.add(newUserAddress);
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({"addresses": userAddresses}, SetOptions(merge: true));
      Get.back();
    }
  }
}
