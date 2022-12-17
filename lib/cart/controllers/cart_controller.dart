import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:bakery_app/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class CartController extends BaseController {
  RxInt animatedHeight = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animatedHeight.value = 0;
    ProfileController().getUser();
  }

  RxList<Product> cartItemList = <Product>[].obs;

  double getTotalMRP() {
    double sum = 0;
    for (int i = 0; i < cartItemList.length; i++) {
      sum = sum + cartItemList[i].price;
    }
    return sum * 1.17;
  }

  double getDiscountOnMRP() {
    double sum = 0;
    for (int i = 0; i < cartItemList.length; i++) {
      sum = sum + cartItemList[i].price;
    }
    return sum * 0.17;
  }

  double getGrandTotal() {
    double sum = 0;
    for (int i = 0; i < cartItemList.length; i++) {
      sum = sum + cartItemList[i].price;
    }
    return sum;
  }

  double getDeliveryCharges() {
    return 40;
  }
}
