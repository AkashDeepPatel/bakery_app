import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../common/utils/common_assets.dart';
import '../walkthrough_assets.dart';

class WalkThroughController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    // for (int i = walkthroughIndex.value; i < 2; i++) {
    //   walkthroughIndex.value < 2
    //       ? Future.delayed(Duration(seconds: 3), () {
    //           walkthroughIndex.value++;
    //         })
    //       : Future.delayed(Duration(seconds: 3), () {
    //           Get.offAllNamed(HomeScreen.routeName);
    //         });
    // }
  }

  RxInt walkthroughIndex = 0.obs;
  List<WalkthroughItem> walkthroughItems = [
    WalkthroughItem(
      image: WalkthroughAssets.walkthrough1,
      title: "You don't have to wait!",
      description:
          "Schedule your order online, get the order at your doorstep or pick it from the store at your convient time.",
    ),
    WalkthroughItem(
      image: WalkthroughAssets.walkthrough2,
      title: "Live Tracking",
      description: "Real time tracking of your food once you placed the order",
    ),
    WalkthroughItem(
      image: WalkthroughAssets.walkthrough3,
      title: "We serve the best",
      description:
          "Find what you love! Discover the best Baked products over 200 varieties.",
    ),
  ];
}

class WalkthroughItem {
  String? image;
  String? title;
  String? description;
  WalkthroughItem({
    this.image,
    this.title,
    this.description,
  });
}
