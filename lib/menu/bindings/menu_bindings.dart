import 'package:get/get.dart';
import '../controllers/menu_controller.dart';

class MenuBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => MenuController(), fenix: true);
  }
}
