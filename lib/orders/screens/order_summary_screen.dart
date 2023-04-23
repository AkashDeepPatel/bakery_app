import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/orders/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';

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
                  Get.to(() => const OrdersScreen());
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
            const VSpace(36),
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
            const VSpace(16),
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
            const VSpace(16),
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
            const VSpace(16),
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
            const VSpace(24),
            const Divider(),
            const VSpace(16),
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
