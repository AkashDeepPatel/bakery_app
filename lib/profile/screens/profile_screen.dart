import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/profile/screens/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../../common/widgets/app_card.dart';
import '../../welcome_screen/screens/welcome_screen.dart';
import '../widgets/profile_tile_item.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  icon: CommonAssets.settingsIcon,
                  title: "Profile Settings",
                  onTap: () {
                    Get.to(() => EditProfile());
                  },
                ),
                const VSpace(16),
                ProfileItemTile(
                  icon: CommonAssets.locationPin2Icon,
                  title: "Your Address",
                  onTap: () {},
                ),
                // const VSpace(16),
                // ProfileItemTile(
                //     icon: DashboardAssets.selectedOrdersIcon,
                //     title: "Your Orders"),
                const VSpace(16),
                ProfileItemTile(
                  icon: CommonAssets.paymentOptionsIcon,
                  title: "Payment Methods",
                  onTap: () {},
                ),
              ],
            ),
          ),
          AppCard(
            child: Column(
              children: [
                // const VSpace(16),
                //
                // const VSpace(16),
                ProfileItemTile(
                  icon: CommonAssets.rating,
                  title: "Rate Us",
                  onTap: () {},
                ),
                const VSpace(16),
                ProfileItemTile(
                  icon: CommonAssets.feedbackIcon,
                  title: "Send Feedback",
                  onTap: () {},
                ),
                const VSpace(16),
                ProfileItemTile(
                  icon: CommonAssets.customerSupportIcon,
                  title: "Customer Support",
                  onTap: () {},
                ),
              ],
            ),
          ),
          AppCard(
            child: ProfileItemTile(
              icon: CommonAssets.logoutIcon,
              title: "Log Out",
              onTap: () {
                FirebaseAuth.instance.signOut();
                Get.to(WelcomeScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
