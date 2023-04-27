import 'package:bakery_app/cart/model.dart';
import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:bakery_app/dashboard/controllers/dashboard_controller.dart';
import 'package:bakery_app/orders/controllers/orders_controller.dart';
import 'package:bakery_app/orders/screens/orders_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../cart/screens/cart_screen.dart';
import '../order_model.dart';

class PaymentController extends BaseController{

Razorpay razorpay = Razorpay();
  @override
  void onInit() {
    super.onInit();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  Rx<OrderModel> currentCartProductModel = OrderModel(listOfCartProd: []).obs;

  void handlePaymentSuccess(PaymentSuccessResponse response) {
// Do something when payment succeeds
    print("Payment Done");
    Get.find<OrdersController>().addProductToCurrentOrder(currentCartProductModel.value);
    // Get.to(()=>OrdersScreen());
    Get.back();
    Get.find<DashboardController>().changeBottomNavigation(1);
  }

  void handlePaymentError(PaymentFailureResponse response) {
// Do something when payment fails
    print("Payment Fail");
    // Get.to(()=>CartScreen());
    Get.back();
    Get.find<DashboardController>().changeBottomNavigation(2);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
// Do something when an external wallet is selected
  }

  var options = {
    'key': "rzp_test_3uUdABps5fa5pj",
    'name': 'Razorpay Payment Gateway',
    'description': 'Demo',
    'timeout': 120, // in seconds
    // 'prefill': {
    //   'contact': '8787878787',
    //   'email': 'demo@gmail.com'
    // }
  };

}