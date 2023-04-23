import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/dashboard/screens/language_screen.dart';
import 'package:bakery_app/profile/screens/edit_profile.dart';
import 'package:bakery_app/profile/screens/your_address_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/controllers/theme_controller.dart';
import '../../common/localization/localization.g.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../../common/widgets/app_card.dart';
import '../../dashboard/controllers/products.dart';
import '../../dashboard/controllers/user_preferences_controller.dart';
import '../../welcome_screen/screens/welcome_screen.dart';
import '../widgets/profile_tile_item.dart';
import '../widgets/send_feedback_dialog_widget.dart';
import 'chat_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  Ctr ctr = Get.put(Ctr());
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
                  // title: "Profile Settings",
                  title: Localization.profileSetting.tr,
                  onTap: () {
                    Get.to(() => EditProfile());
                  },
                ),
                const VSpace(16),
                ProfileItemTile(
                  icon: CommonAssets.locationPin2Icon,
                  // title: "Your Address",
                  title: Localization.profileAddress.tr,
                  onTap: () {
                    Get.to(() => YourAddressScreen());
                  },
                ),
                // const VSpace(16),
                // ProfileItemTile(
                //     icon: DashboardAssets.selectedOrdersIcon,
                //     title: "Your Orders"),
                const VSpace(16),
                ProfileItemTile(
                  icon: CommonAssets.paymentOptionsIcon,
                  // title: "Payment Methods",
                  title: Localization.profilePayment.tr,
                  onTap: () {},
                ),
                const VSpace(16),
                ProfileItemTile(icon: CommonAssets.exploreIcon,
                    // title: "Languages",
                    title: Localization.profileLanguage.tr,
                    onTap: (){
                  Get.to(()=>LanguageScreen());
                }),
                const VSpace(16),
                Obx(()=>ProfileItemTile(icon: CommonAssets.exploreIcon,
                  // title: "Change Theme",
                  title: Localization.profileTheme.tr,
                  onTap: (){
                    null;
                  },
                  showSwitch: true,
                  switchValue: Get.find<ThemeController>().blackTheme.value,
                  switchAction: (val) {
                    Get.find<ThemeController>().updateTheme(val);
                    Get.find<UserPreferencesController>().selectTheme();
                  },
                )),
              ],
            ),
          ),
          AppCard(
            child: Column(
              children: [
                ProfileItemTile(
                  icon: CommonAssets.rating,
                  // title: "Rate Us",
                  title: Localization.profileRate.tr,
                  onTap: () {
                    Get.showSnackbar(const GetSnackBar(
                      message: "Coming Soon",
                      isDismissible: true,
                      backgroundColor: AppThemes.black,
                      duration: Duration(seconds: 3),
                    ));
                  },
                ),
                const VSpace(16),
                ProfileItemTile(
                  icon: CommonAssets.feedbackIcon,
                  // title: "Send Feedback",
                  title: Localization.profileFeedback.tr,
                  onTap: () {
                    Get.dialog(SendFeedbackDialogWidget());
                  },
                ),
                // const VSpace(16),
                // ProfileItemTile(
                //   icon: CommonAssets.feedbackIcon,
                //   title: "ADD FOR YOU PRODUCTS",
                //   onTap: () {
                //     ctr.addForYourProductsToFirebase();
                //   },
                // ),
                const VSpace(16),
                // ProfileItemTile(
                //   icon: CommonAssets.feedbackIcon,
                //   title: "ADD POPULAR PRODUCTS",
                //   onTap: () {
                //     ctr.addPopularProductsToFirebase();
                //   },
                // ),
                // const VSpace(16),
                // ProfileItemTile(
                //   icon: CommonAssets.feedbackIcon,
                //   title: "ADD HOME CATEGORIES",
                //   onTap: () {
                //     ctr.addHomeCategoriesToFirebase();
                //     debugPrint("123");
                //   },
                // ),
                // const VSpace(16),
                // ProfileItemTile(
                //   icon: CommonAssets.feedbackIcon,
                //   title: "ADD COOKIES",
                //   onTap: () {
                //     ctr.addCookiesToFirebase();
                //   },
                // ),
                // const VSpace(16),
                ProfileItemTile(
                  icon: CommonAssets.customerSupportIcon,
                  // title: "Customer Support",
                  title: Localization.profileCustomerSupport.tr,
                  onTap: () {
                    Get.to(() => ChatScreen());
                    // Get.showSnackbar(const GetSnackBar(
                    //   message: "Coming Soon",
                    //   isDismissible: true,
                    //   backgroundColor: AppThemes.black,
                    //   duration: Duration(seconds: 3),
                    // ));
                  },
                ),
              ],
            ),
          ),
          AppCard(
            child: ProfileItemTile(
              icon: CommonAssets.logoutIcon,
              // title: "Log Out",
              title: Localization.profileLogOut.tr,
              onTap: () {
                Get.dialog(AlertDialog(
                  actionsPadding: EdgeInsets.all(16),
                  title:
                      // Center(child: Text("Are you sure you want to logout?")),
                      Center(child: Text(Localization.profileAYSYWTL.tr)),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: AppTextButton(
                          // text: "Cancel",
                          text: Localization.profileCancle.tr,
                          onTap: () {
                            Get.back();
                          },
                        )),
                        HSpace(16),
                        Expanded(
                            child: AppTextButton(
                          // text: "Logout",
                          text: Localization.profileLogOut.tr,
                          color: Colors.red,
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                            Get.to(const WelcomeScreen());
                          },
                        )),
                      ],
                    )
                  ],
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
