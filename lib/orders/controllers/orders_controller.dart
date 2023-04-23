import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:get/get.dart';

class OrdersController extends BaseController {
  RxBool timeNow = true.obs;
  RxBool deliveryTypeSelf = true.obs;
  Rx<DateTime> deliveryDateTime = DateTime.now().obs;
}
