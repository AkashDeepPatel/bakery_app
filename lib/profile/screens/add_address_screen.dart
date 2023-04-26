import 'package:bakery_app/common/localization/localization.g.dart';
import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/common/widgets/app_text_field.dart';
import 'package:bakery_app/profile/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';

class AddNewAddressScreen extends StatelessWidget {
  AddNewAddressScreen({Key? key}) : super(key: key);
  AddressController controller = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      showBottomWidget: true,
      bottomWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppTextButton(
          // text: "Save",
          text: Localization.addAddressSave.tr,
          onTap: () {
            controller.addUserAddress();
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Text("Add a new Address"),
            Text(Localization.addAddressNewAddress.tr),
            VSpace(16),
            AppTextField(
              // title: "Full Name",
              title: Localization.createAccountFullName.tr,
              controller: controller.nameCtr.value,
            ),
            VSpace(8),
            AppTextField(
              // title: "Phone Number",
              title: Localization.createAccountPhoneNum.tr,
              controller: controller.phoneCtr.value,
              textInputType: TextInputType.phone,
            ),
            VSpace(8),
            AppTextField(
              // title: "Flat no./ House no.",
              title: Localization.addAddressFlatHouseNo.tr,
              controller: controller.flatNoCtr.value,
            ),
            VSpace(8),
            AppTextField(
              // title: "Landmark",
              title: Localization.addAddressLandmark.tr,
              controller: controller.landmarkCtr.value,
            ),
            VSpace(8),
            AppTextField(
              // title: "Area/ Street/ sector",
              title: Localization.addAddressArea.tr,
              controller: controller.areaCtr.value,
            ),
            VSpace(8),
            Row(
              children: [
                Expanded(
                    child: AppTextField(
                  // title: "City/ Town",
                  title: Localization.addAddressCity.tr,
                  controller: controller.cityCtr.value,
                )),
                HSpace(8),
                Expanded(
                  child: AppTextField(
                    // title: "Pincode",
                    title: Localization.addAddressPincode.tr,
                    controller: controller.pincodeCtr.value,
                    textInputType: TextInputType.number,
                  ),
                )
              ],
            ),
            // VSpace(16),
            // Obx(() => InkWell(
            //       onTap: () {
            //         controller.isDefault(!controller.isDefault.value);
            //       },
            //       child: Row(
            //         children: [
            //           controller.isDefault.value
            //               ? Icon(
            //                   Icons.radio_button_checked_rounded,
            //                   color: AppThemes.primary,
            //                 )
            //               : Icon(Icons.radio_button_unchecked_rounded),
            //           HSpace(5.0),
            //           // Text("Make this my default address.")
            //           Text(Localization.addAddressDefaultAddress.tr)
            //         ],
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }
}
