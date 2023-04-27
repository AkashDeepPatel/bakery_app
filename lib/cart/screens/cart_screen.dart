import 'package:bakery_app/common/localization/localization.g.dart';
import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/orders/screens/schedule_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../controllers/cart_controller.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends GetView<CartController> {
  CartScreen({Key? key}) : super(key: key);
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      showlocation: true,
      bottomWidgetBottomPadding: 0.0,
      bottomWidgetHPadding: 0.0,
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
                      : _cartController.animatedHeight.value = 150;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                      child: SvgPicture.asset(CommonAssets.downArrowIcon),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                height: _cartController.animatedHeight.value.toDouble(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView(
                    // reverse: true,
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    //int i =5
                    children: [
                      Text(
                        // "Price Details(${controller.cartItemList.length} items)",
                  "${Localization.cartPriceDetail.tr} ${controller.cartItemList.length} ${Localization.cartItem.tr}",

                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const VSpace(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // "Total MRP",
                            Localization.cartTotalMRP.tr,
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
                            // "Discount on MRP",
                            Localization.cartDiscountOnMRP.tr,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "- \$ ${controller.getDiscountOnMRP()}",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      // const VSpace(8),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       // "Delivery Charges",
                      //       Localization.cartDeliveryCharges.tr,
                      //       style: Theme.of(context).textTheme.labelLarge,
                      //     ),
                      //     Text(
                      //       "+ \$ ${controller.getDeliveryCharges()}",
                      //       style: Theme.of(context).textTheme.labelLarge,
                      //     ),
                      //   ],
                      // ),
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
                            // "Grand Total",
                            Localization.cartGrandTotal.tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "\$ ${controller.getGrandTotal()}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
              AppTextButton(
                // text: "Checkout",
                text: Localization.cartCheckout.tr,
                textColor: AppThemes.white,
                color: AppThemes.black,
                onTap: () {
                  Get.to(() => ScheduleOrderScreen());
                },
              ),
            ],
          ),
        ),
      ),
      child: Obx(()=>Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                // const VSpace(20),
                // AppTextField(
                //   hintText: "Apply Coupon Code",
                //   suffixIcon: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: SvgPicture.asset(
                //       CommonAssets.discount,
                //     ),
                //   ),
                // ),
                // const VSpace(10),
                // AppTextField(
                //   hintText: "Want to schedule your pickup / delivery ?",
                //   suffixIcon: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: SvgPicture.asset(
                //       CommonAssets.rightArrowIcon,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          // const VSpace(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              // "Your Cart",
              Localization.cartYourCart.tr,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const VSpace(16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: controller.cartItemList.isNotEmpty
                  ? ListView.separated(itemBuilder: (context, index){
                return CartItemTile(
                  model: controller.cartItemList[index],
                );
              }, separatorBuilder: (context, index){
                return SizedBox();
              }, itemCount: controller.cartItemList.length)
                  :  Center(child: Text(
                // "No Products in Cart"
                  Localization.cartNoProduct.tr)),
            ),
          ),
        ],
      )),
    );
  }
}

