import 'package:bakery_app/cart/model.dart';
import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../order_model.dart';

class OrdersController extends BaseController with GetSingleTickerProviderStateMixin{

  RxBool timeNow = true.obs;
  RxBool deliveryTypeSelf = true.obs;
  Rx<DateTime> deliveryDateTime = DateTime.now().obs;

  late TabController tabController;

  onInit(){
    super.onInit();
    tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  List<String> tabs = ["Current Orders", "Past Orders"];

  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;

  RxList<OrderModel>currentOrder = <OrderModel>[].obs;

  RxList<OrderModel>orderHistory = <OrderModel>[].obs;

  addProductToCurrentOrder(OrderModel model){
    currentOrder.add(model);
    // debugPrint("---Product added");
    Future.delayed(Duration(seconds: 30),(){
      orderHistory.add(model);
      currentOrder.remove(model);
    });
  }
}
