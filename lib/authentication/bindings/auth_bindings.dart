import 'package:get/get.dart';
import '../controllers/authentication_controller.dart';

class AuthBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(AuthenticationController(), permanent: true);
  }
}
