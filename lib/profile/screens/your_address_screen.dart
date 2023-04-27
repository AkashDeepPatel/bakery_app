import 'package:bakery_app/common/localization/localization.g.dart';
import 'package:bakery_app/common/widgets/app_card.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/orders/controllers/orders_controller.dart';
import 'package:bakery_app/profile/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/screens/common_base_class.dart';
import 'add_address_screen.dart';

class YourAddressScreen extends StatelessWidget {
  YourAddressScreen({Key? key, this.showAppBar, this.doSelect=false}) : super(key: key);
  final AddressController controller = Get.put(AddressController());

  bool? showAppBar;
  bool? doSelect;

  @override
  Widget build(BuildContext context) {
    int selectedRadio = 0;
    return CommonBaseClass(
        showAppBar: showAppBar ?? true,
        pageTitle: "Your Addresses",
        showBottomWidget: true,
        bottomWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppTextButton(
            // text: "Add Address",
            text: Localization.yourAddressAddAddress.tr,
            onTap: () {
              Get.to(() => AddNewAddressScreen());
            },
          ),
        ),
        child: Obx(
          () => controller.userAddresses.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.userAddresses.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Get.find<OrdersController>().locationController.value.text=(doSelect!?"${controller.userAddresses[index]['name']}, ${controller.userAddresses[index]['flatNo']}, ${controller.userAddresses[index]['landmark']}, ${controller.userAddresses[index]['area']}, ${controller.userAddresses[index]['city']}, ${controller.userAddresses[index]['pincode']}":null)!;
                        Get.find<OrdersController>().phoneController.value.text=(doSelect!?"${controller.userAddresses[index]['mobile']}":null)!;
                        doSelect!?Get.back():null;
                      },
                      child: AppCard(
                        child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text("${controller.userAddresses[index]['name']}"),
                            Text(
                                "${controller.userAddresses[index]['flatNo']}, ${controller.userAddresses[index]['landmark']}, ${controller.userAddresses[index]['area']}, ${controller.userAddresses[index]['city']}, ${controller.userAddresses[index]['pincode']}"),
                            Text(
                                "Phone no: ${controller.userAddresses[index]['mobile']}")
                          ],
                        ),
                      ),
                    );
                      // RadioListTile(
                      //   value: index,
                      //   groupValue: selectedRadio,
                      //   isThreeLine: true,
                      //   title:
                      //       Text("${controller.userAddresses[index]['name']}"),
                      //   subtitle: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text("${controller.userAddresses[index]['name']}"),
                      //       Text(
                      //           "${controller.userAddresses[index]['flatNo']}, ${controller.userAddresses[index]['landmark']}, ${controller.userAddresses[index]['area']}, ${controller.userAddresses[index]['city']}, ${controller.userAddresses[index]['pincode']}"),
                      //       Text(
                      //           "Phone no: ${controller.userAddresses[index]['mobile']}")
                      //     ],
                      //   ),
                      //   onChanged: (value) {});
                  })
              : Center(child: Text(
              // "No Saved Address to show."
              Localization.yourAddressNoSavedAddress.tr
          )),
        ));
  }
}
