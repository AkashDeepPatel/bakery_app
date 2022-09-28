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

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt _animatedHeight = 0.obs;
    return CommonBaseClass(
      showAppBar: true,
      showlocation: true,
      isOrdersScreen: true,
      showBottomWidget: true,
      bottomWidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: AppTextButton(
          text: "Tracking Map",
          color: AppThemes.black,
          onTap: () {
            // Get.to(() => ScheduleOrderScreen());
          },
        ),
      ),
      child: ListView(
        children: [
          const VSpace(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Estimated Delivery",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          VSpace(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "1 Sep, 2022 | 09:00PM",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppThemes.subtleDark),
            ),
          ),
          const VSpace(48),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HSpace(24),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(CommonAssets.tickIcon),
                  Container(
                    height: 100,
                    width: 2,
                    color: Colors.green,
                  ),
                  SvgPicture.asset(CommonAssets.tickIcon),
                  Container(
                    height: 50,
                    width: 2,
                    color: AppThemes.subtleLight,
                  ),
                  SvgPicture.asset(CommonAssets.untickedIcon),
                  Container(
                    height: 50,
                    width: 2,
                    color: AppThemes.subtleLight,
                  ),
                  SvgPicture.asset(CommonAssets.untickedIcon),
                ],
              ),
              HSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VSpace(7),
                  Text(
                    "Order Placed",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  VSpace(115),
                  Text(
                    "Order Preparing",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  VSpace(57.5),
                  Text(
                    "On the Way",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  VSpace(50),
                  Text(
                    "Delivered!",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
