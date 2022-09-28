import 'package:get/get.dart';
import '../../walkthrough/controllers/walkthrough_controller.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => WalkThroughController(), fenix: true);
  }
}
