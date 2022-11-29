import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../bindings/dashboard_bindings.dart';
import '../utils/dashboard_assets.dart';

class DashboardController extends BaseController {
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  changeBottomNavigation(int index) async {
    currentIndex.value = index;
    await refreshPage(index);
  }

  Future<void> refreshPage(int index) async {
    switch (index) {
      case 0:
        {
          DashboardBindings().dependencies();
          break;
        }
      case 1:
        {
          DashboardBindings().dependencies();
          break;
        }
      case 2:
        {
          DashboardBindings().dependencies();
          break;
        }
      case 3:
        {
          DashboardBindings().dependencies();
          break;
        }
      case 4:
        {
          DashboardBindings().dependencies();
          break;
        }
    }
  }

  List itemsCategory = [
    "All",
    "Cakes",
    "Cookies",
    "Biscuits",
    "All",
    "Cakes",
    "Cookies",
    "Biscuits",
  ];

  RxInt currentSliderIndex = 0.obs;
  List<Image> carouselSliderItems = [
    Image.asset(
      DashboardAssets.corousalPlaceholder,
    ),
    Image.asset(
      DashboardAssets.corousalPlaceholder,
    ),
    Image.asset(
      DashboardAssets.corousalPlaceholder,
    ),
    Image.asset(
      DashboardAssets.corousalPlaceholder,
    ),
  ];
}
