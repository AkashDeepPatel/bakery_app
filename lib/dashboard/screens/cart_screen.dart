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

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt _animatedHeight = 0.obs;
    return CommonBaseClass(
      showAppBar: true,
      showlocation: true,
      showBottomWidget: true,
      bottomWidget: Obx(
        () => Container(
          decoration: const BoxDecoration(
              color: AppThemes.purple,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  _animatedHeight.value != 0
                      ? _animatedHeight.value = 0
                      : _animatedHeight.value = 200;
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                  child: SvgPicture.asset(CommonAssets.downArrowIcon),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price Details(3 items)",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      VSpace(8),
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
                      VSpace(8),
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
                      VSpace(8),
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
                      VSpace(8),
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
                      VSpace(8),
                      Divider(),
                      VSpace(8),
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
                height: _animatedHeight.value.toDouble(),
              ),
              AppTextButton(
                text: "Checkout",
                color: AppThemes.black,
                onTap: () {
                  Get.to(() => ScheduleOrderScreen());
                },
              ),
              const VSpace(8),
            ],
          ),
        ),
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                AppTextField(
                  hintText: "Apply Coupon Code",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      CommonAssets.discount,
                    ),
                  ),
                ),
                AppTextField(
                  hintText: "Want to schedule your pickup / delivery ?",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      CommonAssets.rightArrowIcon,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const VSpace(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Your Cart",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const VSpace(16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CartItemTile(),
          ),
        ],
      ),
    );
  }
}

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            SizedBox(
              width: 170,
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                      child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(CommonAssets.bread))),
                  Positioned(
                    bottom: 0,
                    left: 30,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppThemes.primary,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 6.0),
                        child: Row(
                          children: [
                            const Icon(Icons.remove, color: AppThemes.black),
                            const HSpace(10),
                            Text("1",
                                style: Theme.of(context).textTheme.labelLarge),
                            const HSpace(10),
                            const Icon(Icons.add, color: AppThemes.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const HSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dukes - Waffy Wafers - pineapp",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const VSpace(40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$ 400.00",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "\$ 450.00",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
