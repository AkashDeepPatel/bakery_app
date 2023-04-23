import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends BaseController {
  RxInt animatedHeight = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animatedHeight.value = 0;
  }

  RxList cartItemList = [].obs;

  getUserCart() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      cartItemList.value = documentSnapshot.get('cart');
    }
  }

  addItemInCart() {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({"cart": cartItemList}, SetOptions(merge: true));
    }
  }

  double getTotalMRP() {
    double sum = 0;
    for (int i = 0; i < cartItemList.length; i++) {
      sum = sum + cartItemList[i]['price'];
    }
    return sum * 1.17;
  }

  double getDiscountOnMRP() {
    double sum = 0;
    for (int i = 0; i < cartItemList.length; i++) {
      sum = sum + cartItemList[i]['price'];
    }
    return sum * 0.17;
  }

  double getGrandTotal() {
    double sum = 0;
    for (int i = 0; i < cartItemList.length; i++) {
      sum = sum + cartItemList[i]['price'];
    }
    return sum;
  }

  double getDeliveryCharges() {
    return 40;
  }
}
