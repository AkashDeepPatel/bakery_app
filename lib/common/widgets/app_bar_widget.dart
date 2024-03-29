import 'package:bakery_app/common/localization/localization.g.dart';
import 'package:bakery_app/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../dashboard/screens/wishlist_screen.dart';
import '../../profile/controllers/address_controller.dart';
import '../controllers/base_controller.dart';
import '../styles/app_themes.dart';
import '../utils/arch_utils/widgets/spacing_widgets.dart';
import '../utils/common_assets.dart';
import 'app_bottom_sheet.dart';
import 'app_text_field.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  BaseController baseController = Get.put(BaseController());
  AddressController addressController = Get.put(AddressController());
  ProfileController controller = Get.find();


  AppBarWidget({
    Key? key,
    this.showBackIcon,
    this.pageTitle,
    this.showSearchBar,
    this.isProfileScreen,
    this.showlocation,
    this.showActionButtons,
  }) : super(key: key);
  bool? showBackIcon;
  String? pageTitle;
  bool? showSearchBar;
  bool? isProfileScreen;
  bool? showlocation;
  bool? showActionButtons;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        // borderRadius: BorderRadius.horizontal(
        //     left: Radius.circular(16.0), right: Radius.circular(16.0)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16.0, top: 40, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showlocation == true)
                  Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Welcome, ${controller.username.value.text}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: AppThemes.primary,
                                radius: 12,
                                child:
                                    SvgPicture.asset(CommonAssets.locationPinIcon),
                              ),
                              const HSpace(12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  baseController.placemark.isNotEmpty
                                      ? Text(
                                          "${baseController.placemark[0].locality}, ${baseController.placemark[0].postalCode}",
                                          style:
                                              Theme.of(context).textTheme.bodySmall,
                                        )
                                      : Text(
                                      // "Loading"
                                      Localization.appBarLoading.tr
                                  ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     Get.bottomSheet(const AppBottomSheet());
                                  //   },
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //         // "Select Location",
                                  //         Localization.appBarSelectLocation.tr,
                                  //         style: Theme.of(context)
                                  //             .textTheme
                                  //             .labelLarge,
                                  //       ),
                                  //       const HSpace(5),
                                  //       SvgPicture.asset(
                                  //           CommonAssets.downArrowIcon),
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              )
                            ],
                          ),
                    ],
                  ))
                else
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_outlined, color: Theme.of(context).textTheme.titleMedium!.color,)),
                // const Spacer(),
                if (pageTitle != "")
                  Center(
                    child: Text(
                      pageTitle!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                // const Spacer(),
                // showActionButtons!?
                // Row(
                //   children: [
                    InkWell(
                        onTap: () {
                          Get.to(() => WishlistScreen());
                        },
                        child: SvgPicture.asset(CommonAssets.favouritesIcon,
                        color: Theme.of(context).textTheme.titleMedium!.color,
                        )),
                //     const HSpace(15),
                //     // InkWell(
                //     //     onTap: () {},
                //     //     child: SvgPicture.asset(CommonAssets.notificationIcon)),
                //
                //   ],
                // ):SizedBox(),
              ],
            ),
            // showSearchBar==true?const VSpace(10):SizedBox(),
            if (showSearchBar == true)
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Flexible(
              //       child: AppTextField(
              //         // hintText: "Search",
              //         hintText: Localization.appBarSearch.tr,
              //         prefixIcon: const Icon(Icons.search),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 4.0),
              //       child: InkWell(
              //         onTap: () {},
              //         child: Card(
              //             color: AppThemes.primary,
              //             child: Padding(
              //               padding: const EdgeInsets.all(13.0),
              //               child: SvgPicture.asset(CommonAssets.micIcon),
              //             )),
              //       ),
              //     )
              //   ],
              // ),
            const VSpace(10),
            // if (isOrdersScreen == true)
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const VSpace(40),
            //       Text(
            //         // "Current Order",
            //         Localization.appBarCurrentOrder.tr,
            //         style: Theme.of(context).textTheme.titleMedium,
            //       ),
            //       const HSpace(30),
            //       Text(
            //         // "Past Order",
            //         Localization.appBarPastOrder.tr,
            //         style: Theme.of(context).textTheme.titleMedium,
            //       )
            //     ],
            //   ),
            // if (isProfileScreen == true)
            //   Column(
            //     children: [
            //       Obx(()=>Container(
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //           ),
            //           child: BaseController.getIcon(controller.profilePicUrl.value,"name", height: 90, width: 90, radius: 64))),
            //       const VSpace(4),
            //       Text(
            //         controller.username.value.text,
            //         style: Theme.of(context).textTheme.labelLarge,
            //       ),
            //       const VSpace(16),
            //     ],
            //   )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 500);
}
