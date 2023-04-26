import 'dart:io';

import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    getUser();
    getProfilePicture();
  }

  Rx<TextEditingController> username = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> phoneNo = TextEditingController().obs;
  // Rx<TextEditingController> phoneNo = TextEditingController().obs;

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

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  RxString profilePicUrl = "".obs;

  getProfilePicture() {
    RxStatus.loading();
      profilePicUrl.value = firebaseStorage.ref().child('profilePictures/${firebaseAuth.currentUser!.uid}').fullPath;
      // debugPrint("---$url");
    debugPrint("<->${profilePicUrl.value}");
    RxStatus.success();
  }

  setProfileImage(int type) async {
    XFile? tempImage;
    if (type == 0) {
      tempImage = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 30);
    } else {
      tempImage = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 30);
    }
    if (tempImage != null) {
      try{
        firebaseStorage.ref().child("profilePictures/${firebaseAuth.currentUser!.uid}").putFile(File(tempImage.path));
        getProfilePicture();
      }catch(e){
        debugPrint(e.toString());
      }
    }
  }
}
