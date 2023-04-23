import 'package:bakery_app/dashboard/controllers/home_controller.dart';
import 'package:get/get.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../menu/controllers/menu_controller.dart';
import '../../orders/controllers/orders_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/wishlist_controller.dart';

class DashboardBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => OrdersController(), fenix: true);
    Get.lazyPut(() => ItemMenuController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => WishlistController(), fenix: true);
  }
}
