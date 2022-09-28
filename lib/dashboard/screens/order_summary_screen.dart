import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../../common/widgets/app_text_field.dart';
import 'orders_screen.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      // pageTitle: "Your Order Summary",
      showBottomWidget: true,
      bottomWidget: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: Text(
              "\$ 280",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: AppTextButton(
                text: "Checkout",
                color: AppThemes.black,
                onTap: () {
                  Get.to(() => OrdersScreen());
                },
              ),
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Text("| Your Order Summary",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            Text(
              "Price Details(3 items)",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            VSpace(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total MRP",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  "\$ 500",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            VSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount on MRP",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  "\$ 29",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            VSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Charges",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  "\$ 30",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            VSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Coupoun Discount",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  "\$ 31",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            VSpace(24),
            Divider(),
            VSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Grand Total",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  "\$ 500",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppDropdownList extends StatelessWidget {
  AppDropdownList({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 56,
          decoration:
              BoxDecoration(border: Border.all(color: AppThemes.subtleDark)),
          // color: AppThemes.primarySubtle3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                ),
                SvgPicture.asset(CommonAssets.downArrowIcon)
              ],
            ),
          )),
    );
  }
}
