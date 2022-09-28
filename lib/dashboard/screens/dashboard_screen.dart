import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_field.dart';
import 'package:bakery_app/dashboard/screens/home_screen.dart';
import 'package:bakery_app/dashboard/screens/profile_screen.dart';
import 'package:bakery_app/dashboard/utils/dashboard_assets.dart';
import 'package:bakery_app/dashboard/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../controllers/dashboard_controller.dart';
import 'cart_screen.dart';
import 'menu_screen.dart';
import 'orders_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = "/dashboard";
  DashboardScreen({Key? key}) : super(key: key);

  final DashboardController _dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: _dashboardController.currentIndex.value,
            children: [
              HomeScreen(),
              OrdersScreen(),
              MenuScreen(),
              CartScreen(),
              ProfileScreen(),
            ],
          )),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
