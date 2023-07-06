import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemMenuController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    // getMenuItems();
    // debugPrint("menuCtr");
  }

  RxList menuItems = [].obs;
  RxInt selectedMenuItem = 0.obs;

  // final _firestore = FirebaseFirestore.instance;
  // getMenuItems() async {
  //   try {
  //     QuerySnapshot qs = await _firestore.collection('products').get();
  //     for (var item in qs.docs) {
  //       //   menuItems.add(item.id);
  //       debugPrint("menu ${item.id}");
  //     }
  //     // debugPrint("menu ${menuItems}");
  //   } catch (e) {
  //     debugPrint("$e");
  //   }
  // }

  Map<String, List<String>> menuItemsMap = {
    "Bread": [
      "Brown Breads",
      "Multi-Grain Breads",
      "Corn Breads",
      "Quick Breads",
      "Yeast Breads",
      "Brioche",
      "Challah",
      "Focaccia",
      "Soft Rolls",
      "Flatbreads",
      "Soda Breads",
      "Honey and Oat Breads",
      "Walnut Breads",
    ],
    "Cakes": [
      "Butter Cake",
      "Pound Cake",
      "Sponge Cake",
      "Genoise Cake",
      "Buiscuit Cake",
      "Baked Flourless Cake",
      "Unbaked Flourless Cake"
    ],
    "Cookies": [
      "Chocolate Chips Cookies",
      "Shortbread Cookies",
      "Peanut Butter Cookies",
      "Sugar Cookies"
    ],
    "Desserts": [
      "Apple Pie",
      "Almond Malai Kulfi",
      "Lemon Tart",
      "Coconut Kheer",
      "Chocolate Coffee Truffle"
    ],
    "Pizza": [
      "Cheese Pizza",
      "Veggie  Pizza",
      "Greek Pizza",
      "Chicago Pizza",
      "Cake"
    ],
    "Muffins": [],
  };
  // RxInt selectedMenuItem = 1.obs;
}
