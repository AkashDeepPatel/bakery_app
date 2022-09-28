import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../dashboard/screens/home_screen.dart';
import '../styles/app_themes.dart';
import '../utils/arch_utils/widgets/spacing_widgets.dart';
import '../utils/common_assets.dart';
import 'app_text_field.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    Key? key,
    this.showBackIcon,
    this.pageTitle,
    this.showSearchBar,
    this.isOrdersScreen,
    this.isProfileScreen,
    this.showlocation,
  }) : super(key: key);
  bool? showBackIcon;
  String? pageTitle;
  bool? showSearchBar;
  bool? isOrdersScreen;
  bool? isProfileScreen;
  bool? showlocation;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(16.0), right: Radius.circular(16.0)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16.0, top: 40, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (showlocation == true)
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppThemes.primary,
                        radius: 17,
                        child: SvgPicture.asset(CommonAssets.locationPinIcon),
                      ),
                      const HSpace(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bhilai, Chhattisgarh",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Row(
                            children: [
                              Text(
                                "Select Location",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const HSpace(5),
                              SvgPicture.asset(CommonAssets.downArrowIcon)
                            ],
                          )
                        ],
                      )
                    ],
                  )
                else
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios_outlined)),
                Spacer(),
                if (pageTitle != "")
                  Text(
                    pageTitle!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                const Spacer(),
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(CommonAssets.exploreIcon)),
                const HSpace(15),
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(CommonAssets.notificationIcon)),
                const HSpace(15),
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(CommonAssets.favouritesIcon)),
              ],
            ),
            // const VSpace(10),

            if (showSearchBar == true)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: AppTextField(
                      hintText: "Search Option",
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                          color: AppThemes.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(CommonAssets.micIcon),
                          )),
                    ),
                  )
                ],
              ),
            const VSpace(10),

            if (isOrdersScreen == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VSpace(40),
                  Text(
                    "Current Order",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  HSpace(30),
                  Text(
                    "Past Order",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            if (isProfileScreen == true)
              Column(
                children: [
                  SvgPicture.asset(
                    CommonAssets.circularPlaceholder,
                    height: 90,
                  ),
                  VSpace(4),
                  Text(
                    "Akash Deep Patel",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  VSpace(4),
                  Text(
                    "Edit",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppThemes.subtleLight),
                  ),
                  VSpace(20),
                ],
              )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 500);
}
