import 'package:bakery_app/dashboard/screens/home_screen.dart';
import 'package:bakery_app/profile/screens/profile_screen.dart';
import 'package:bakery_app/dashboard/widgets/bottom_navigation_bar_widget.dart';
import 'package:bakery_app/orders/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../cart/screens/cart_screen.dart';
import '../../menu/screens/menu_screen.dart';

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
