import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => DashboardController(), fenix: true);
  }
}
