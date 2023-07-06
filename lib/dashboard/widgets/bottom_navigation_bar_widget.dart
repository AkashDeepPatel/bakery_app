import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../common/localization/localization.g.dart';
import '../../common/styles/app_themes.dart';
import '../controllers/dashboard_controller.dart';
import '../utils/dashboard_assets.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
      builder: (dashboardController) {
        return Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: AppThemes.normal.withOpacity(0.05),
                offset: const Offset(0, -4),
                blurRadius: 16,
                spreadRadius: 0)
          ]),
          child: ClipRRect(
            child: BottomNavigationBar(
              // backgroundColor: AppThemes.white,
              selectedLabelStyle: Theme.of(context).textTheme.labelSmall,
              unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
              unselectedItemColor: AppThemes.subtleDark,
              selectedItemColor: AppThemes.primary,
              elevation: 5.0,
              currentIndex: dashboardController.currentIndex.value,
              onTap: (index) {
                dashboardController.changeBottomNavigation(index);
              },
              items: <BottomNavigationBarItem>[
                bottomNavItem(DashboardAssets.unselectedHomeIcon,
                    DashboardAssets.selectedHomeIcon, Localization.buttonHome.tr, context),
                bottomNavItem(DashboardAssets.unselectedOrdersIcon,
                    DashboardAssets.selectedOrdersIcon, Localization.dashboadOrders.tr, context),
                // bottomNavItem(DashboardAssets.unselectedCategoryIcon,
                //     DashboardAssets.selectedCategoryIcon, Localization.dashboadMenu.tr, context),
                bottomNavItem(DashboardAssets.unselectedCartIcon,
                    DashboardAssets.selectedCartIcon, Localization.dashboadCart.tr, context),
                bottomNavItem(DashboardAssets.unselectedProfileIcon,
                    DashboardAssets.selectedProfileIcon, Localization.dashboadProfile.tr, context),
              ],
            ),
          ),
        );
      },
    );
  }
}

BottomNavigationBarItem bottomNavItem(String unselectedIcon,
    String selectedIcon, String label, BuildContext context) {
  return BottomNavigationBarItem(
    activeIcon: Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 2),
      child: SvgPicture.asset(
        selectedIcon,
        color: AppThemes.primary,
      ),
    ),
    icon: Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4),
      child: SvgPicture.asset(
        unselectedIcon,
      ),
    ),
    label: label,
  );
}
