import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:bakery_app/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class CartController extends BaseController {
  RxInt animatedHeight = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animatedHeight.value = 0;
    ProfileController().getUser();
  }
}
