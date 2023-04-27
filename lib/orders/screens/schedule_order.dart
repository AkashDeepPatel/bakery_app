import 'package:bakery_app/cart/controllers/cart_controller.dart';
import 'package:bakery_app/common/localization/localization.g.dart';
import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/orders/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../../common/widgets/app_text_field.dart';
import '../controllers/orders_controller.dart';
import 'package:intl/intl.dart';

class ScheduleOrderScreen extends GetView<OrdersController> {
  ScheduleOrderScreen({Key? key}) : super(key: key);

  final CartController cartCtr = Get.find();
  final PaymentController paymentCtr = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      // pageTitle: "Cart",
      pageTitle: Localization.scheduleOrderCart.tr,
      showBottomWidget: true,
      bottomWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: AppTextButton(
          // text: "Continue",
          text: Localization.scheduleOrderContinue.tr,
          color: AppThemes.black,
          onTap: () {
            paymentCtr.options.addAll({
              'amount': (cartCtr.getGrandTotal()*100).toString(),
            });
            paymentCtr.razorpay.open(paymentCtr.options);
            // Get.to(() => const PaymentMethodScreen());
          },
        ),
      ),
      child: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                      // "| Schedule Your Order! ",
                      Localization.scheduleOrderScheduleOrder.tr,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                Text(
                    // "Deliver to",
                    Localization.scheduleOrderDeliver.tr,
                    style: Theme.of(context).textTheme.labelLarge),
                const VSpace(16),
                AppTextField(
                  // hintText: "Location",
                  hintText: Localization.scheduleOrderLocation.tr,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      CommonAssets.editIcon,
                    ),
                  ),
                ),
                const VSpace(32),
                AppTextField(
                  // hintText: "Phone Number",
                  hintText: Localization.createAccountPhoneNum.tr,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      CommonAssets.editIcon,
                    ),
                  ),
                ),
                const VSpace(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        // "Preferred Delivery Time",
                        Localization.scheduleOrderDeliveryTime.tr,
                        style: Theme.of(context).textTheme.labelLarge),
                    SvgPicture.asset(
                      CommonAssets.downArrowIcon,
                    ),
                  ],
                ),
                const VSpace(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.timeNow(true);
                        },
                        child: Container(
                          height: 50,
                          color: controller.timeNow.value == true
                              ? AppThemes.primary
                              : AppThemes.primarySubtle3,
                          child: Center(
                              child: Text(
                            // "Now",
                            Localization.scheduleOrderNow.tr,
                            style: Theme.of(context).textTheme.labelMedium,
                          )),
                        ),
                      ),
                    ),
                    const HSpace(20),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.timeNow(false);
                          showModalBottomSheet(
                              context: (context),
                              builder: (BuildContext context) {
                                return CalendarDatePicker(
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 5)),
                                  initialDate:
                                      controller.deliveryDateTime.value,
                                  onDateChanged: (value) {
                                    controller.deliveryDateTime(value);
                                    Get.back();
                                  },
                                );
                              });
                        },
                        child: Container(
                          height: 50,
                          color: controller.timeNow.value == false
                              ? AppThemes.primary
                              : AppThemes.primarySubtle3,
                          child: Center(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                // "Choose Date and Time",
                                Localization.scheduleOrderChooseDateAndTime.tr,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                DateFormat('dd-MMM-yy').format(controller.deliveryDateTime.value),
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                const VSpace(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        // "Delivery Type",
                        Localization.scheduleOrderDeliveryType.tr,
                        style: Theme.of(context).textTheme.labelLarge),
                    SvgPicture.asset(
                      CommonAssets.downArrowIcon,
                    ),
                  ],
                ),
                const VSpace(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.deliveryTypeSelf(false);
                        },
                        child: Container(
                          height: 50,
                          color: controller.deliveryTypeSelf.value == false
                              ? AppThemes.primary
                              : AppThemes.primarySubtle3,
                          child: Center(
                              child: Text(
                            // "Deliver Me",
                            Localization.scheduleOrderDeliverMe.tr,
                            style: Theme.of(context).textTheme.labelMedium,
                          )),
                        ),
                      ),
                    ),
                    const HSpace(20),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.deliveryTypeSelf(true);
                        },
                        child: Container(
                          height: 50,
                          color: controller.deliveryTypeSelf.value == true
                              ? AppThemes.primary
                              : AppThemes.primarySubtle3,
                          child: Center(
                              child: Text(
                            // "I Will Pick Up",
                            Localization.scheduleOrderPickUp.tr,
                            style: Theme.of(context).textTheme.labelMedium,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
