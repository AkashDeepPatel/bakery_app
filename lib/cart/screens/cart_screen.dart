import 'dart:math';

import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/common/widgets/app_text_field.dart';
import 'package:bakery_app/orders/screens/schedule_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends GetView<CartController> {
  CartScreen({Key? key}) : super(key: key);
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
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
                  _cartController.animatedHeight.value != 0
                      ? _cartController.animatedHeight.value = 0
                      : _cartController.animatedHeight.value = 200;
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                  child: SvgPicture.asset(CommonAssets.downArrowIcon),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                height: _cartController.animatedHeight.value.toDouble(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price Details(${controller.cartItemList.length} items)",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const VSpace(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total MRP",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "\$ ${controller.getTotalMRP()}",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const VSpace(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount on MRP",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "- \$ ${controller.getDiscountOnMRP()}",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const VSpace(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Charges",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "+ \$ ${controller.getDeliveryCharges()}",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const VSpace(8),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Coupoun Discount",
                      //       style: Theme.of(context).textTheme.labelLarge,
                      //     ),
                      //     Text(
                      //       "\$ 31",
                      //       style: Theme.of(context).textTheme.labelLarge,
                      //     ),
                      //   ],
                      // ),
                      const VSpace(8),
                      const Divider(),
                      const VSpace(8),
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
                            "\$ ${controller.getGrandTotal()}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AppTextButton(
                text: "Checkout",
                textColor: AppThemes.white,
                color: AppThemes.black,
                onTap: () {
                  Get.to(() => const ScheduleOrderScreen());
                },
              ),
            ],
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const VSpace(20),
                AppTextField(
                  hintText: "Apply Coupon Code",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      CommonAssets.discount,
                    ),
                  ),
                ),
                const VSpace(10),
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: controller.cartItemList.isNotEmpty
                  ? ListView(
                      children: [
                        for (int i = 0; i < controller.cartItemList.length; i++)
                          CartItemTile(
                            title: controller.cartItemList[i].title,
                            imgUrl: controller.cartItemList[i].imgUrl,
                            price: controller.cartItemList[i].price,
                          )
                      ],
                    )
                  : Text("No Products in Cart"),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemTile extends StatelessWidget {
  CartItemTile({
    Key? key,
    required this.title,
    required this.price,
    required this.imgUrl,
  }) : super(key: key);
  String title;
  String imgUrl;
  double price;

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
                          child: Image.asset(imgUrl,
                              height: 150, width: 200, fit: BoxFit.fitWidth))),
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
                    title,
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
                            "\$ $price",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "\$ ${(price * 1.17).toDouble().round()}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    decoration: TextDecoration.lineThrough),
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
