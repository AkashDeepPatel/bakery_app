import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/common/widgets/app_text_field.dart';
import 'package:bakery_app/dashboard/screens/schedule_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../utils/dashboard_assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt _animatedHeight = 0.obs;
    return CommonBaseClass(
      showAppBar: true,
      showlocation: true,
      isProfileScreen: true,
      child: ListView(
        children: [
          AppCard(
            child: Column(
              children: [
                ProfileItemTile(
                    icon: CommonAssets.locationPin2Icon, title: "Your Address"),
                VSpace(16),
                ProfileItemTile(
                    icon: DashboardAssets.selectedOrdersIcon,
                    title: "Your Orders"),
                VSpace(16),
                ProfileItemTile(
                    icon: CommonAssets.paymentHistoryIcon,
                    title: "Payment History"),
                VSpace(16),
                ProfileItemTile(
                    icon: CommonAssets.customerSupportIcon,
                    title: "Customer Support"),
              ],
            ),
          ),
          AppCard(
            child: Column(
              children: [
                ProfileItemTile(
                    icon: CommonAssets.settingsIcon, title: "Settings"),
                VSpace(16),
                ProfileItemTile(
                    icon: CommonAssets.paymentOptionsIcon,
                    title: "Payment Options"),
                VSpace(16),
                ProfileItemTile(icon: CommonAssets.rating, title: "Rate Us"),
                VSpace(16),
                ProfileItemTile(
                    icon: CommonAssets.feedbackIcon, title: "Send Feedback"),
              ],
            ),
          ),
          AppCard(
            child: ProfileItemTile(
                icon: CommonAssets.logoutIcon, title: "Log Out"),
          ),
        ],
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  AppCard({Key? key, required this.child}) : super(key: key);
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
            child: child,
          ),
        ));
  }
}

class ProfileItemTile extends StatelessWidget {
  ProfileItemTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  String icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        HSpace(24),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
