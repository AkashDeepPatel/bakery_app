import 'package:get/get.dart';
import '../../dashboard/controllers/home_controller.dart';
import '../controllers/menu_controller.dart';

class MenuBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => ItemMenuController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
