import 'package:bakery_app/cart/controllers/cart_controller.dart';
import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/orders/controllers/payment_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../../common/widgets/app_text_field.dart';
import '../../profile/screens/your_address_screen.dart';
import '../controllers/orders_controller.dart';
import 'package:intl/intl.dart';
import '../order_model.dart';

class ScheduleOrderScreen extends GetView<OrdersController> {
  ScheduleOrderScreen({Key? key}) : super(key: key);

  final CartController cartCtr = Get.find();
  final PaymentController paymentCtr = Get.put(PaymentController());

  FirebaseAuth auth = FirebaseAuth.instance;

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
          // color: AppThemes.black,
          textColor: Theme.of(context).iconTheme.color,
          onTap: () {
            paymentCtr.options.addAll({
              'prefill': {
                'contact': auth.currentUser!.phoneNumber,
                'email': auth.currentUser!.email,
              },
              'amount': (cartCtr.getGrandTotal()*100).toString(),
            });
            paymentCtr.currentCartProductModel.value = OrderModel(listOfCartProd: cartCtr.cartItemList, deliveredOn: DateFormat('dd-MMM-yy').format(controller.deliveryDateTime.value), totalOrderValue: cartCtr.getGrandTotal().toString());
            paymentCtr.razorpay.open(paymentCtr.options);
            // Get.to(() => const PaymentMethodScreen());
          },
        ),
      ),
      child: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                Text("| Schedule Your Order! ",
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 16,),
                Text("Deliver to",
                    style: Theme.of(context).textTheme.titleMedium),
                const VSpace(16),
                TextField(
                  readOnly: true,
                  onTap: () {
                    Get.to(()=>YourAddressScreen(doSelect: true));
                  },
                  controller: controller.locationController.value,
                  decoration: InputDecoration(
                    hintText: "Location",
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        CommonAssets.editIcon,
                      ),
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: (){
                //     Get.to(()=>YourAddressScreen(doSelect: true));
                //   },
                //   child: AppTextField(
                //     hintText: "Location",
                //     readOnly: true,
                //     controller: controller.locationController.value,
                //     suffixIcon: Padding(
                //       padding: const EdgeInsets.all(12.0),
                //       child: SvgPicture.asset(
                //         CommonAssets.editIcon,
                //       ),
                //     ),
                //   ),
                // ),
                const VSpace(32),
                AppTextField(
                  hintText: "Phone Number",
                  readOnly: true,
                  controller: controller.phoneController.value,
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
                    Text("Preferred Delivery Time",
                        style: Theme.of(context).textTheme.titleMedium),
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
                            "Now",
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                            ),
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
                                "Choose Date and Time",
                                style: TextStyle(
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                              Text(
                                DateFormat('dd-MMM-yy').format(controller.deliveryDateTime.value),
                                style: TextStyle(
                                  color: Theme.of(context).iconTheme.color,
                                ),
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
                    Text("Delivery Type",
                        style: Theme.of(context).textTheme.titleSmall),
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
                            "Deliver Me",
                                style: TextStyle(
                                  color: Theme.of(context).iconTheme.color,
                                ),                          )),
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
                            "I Will Pick Up",
                                style: TextStyle(
                                  color: Theme.of(context).iconTheme.color,
                                ),                          )),
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
