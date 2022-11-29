import 'package:get/get.dart';
import '../../authentication/controllers/authentication_controller.dart';
import '../../walkthrough/controllers/walkthrough_controller.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => WalkThroughController(), fenix: true);
    Get.lazyPut(() => AuthenticationController(), fenix: true);
  }
}
