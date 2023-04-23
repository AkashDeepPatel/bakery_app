import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    // Get.lazyPut(() => DashboardController(), fenix: true);
    Get.put(ProfileController(), permanent: true);
  }
}
