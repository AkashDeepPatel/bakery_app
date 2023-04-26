import 'package:bakery_app/orders/controllers/orders_controller.dart';
import 'package:bakery_app/orders/controllers/payment_controller.dart';
import 'package:get/get.dart';

class OrdersBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => OrdersController(), fenix: true);
    Get.lazyPut(() => PaymentController(), fenix: true);
  }
}
