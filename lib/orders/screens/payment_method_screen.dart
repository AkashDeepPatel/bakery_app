import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import 'order_summary_screen.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      pageTitle: "Cart",
      showBottomWidget: true,
      bottomWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: AppTextButton(
          text: "Continue",
          color: AppThemes.black,
          onTap: () {
            Get.to(() => const OrderSummaryScreen());
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Text("| Choose Payment Method",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            AppDropdownList(
              title: "Credit/ Debit Card",
            ),
            const VSpace(28),
            AppDropdownList(
              title: "UPI/ Net Banking",
            ),
            const VSpace(28),
            AppDropdownList(
              title: "Cash",
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
          decoration: BoxDecoration(
            border: Border.all(color: AppThemes.subtleLight, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
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
