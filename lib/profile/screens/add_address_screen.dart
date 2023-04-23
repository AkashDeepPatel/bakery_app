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
          text: "Save",
          onTap: () {
            controller.addUserAddress();
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Add a new Address"),
            VSpace(16),
            AppTextField(
              title: "Full Name",
              controller: controller.nameCtr.value,
            ),
            VSpace(8),
            AppTextField(
              title: "Phone Number",
              controller: controller.phoneCtr.value,
            ),
            VSpace(8),
            AppTextField(
              title: "Flat no./ House no.",
              controller: controller.flatNoCtr.value,
            ),
            VSpace(8),
            AppTextField(
              title: "Landmark",
              controller: controller.landmarkCtr.value,
            ),
            VSpace(8),
            AppTextField(
              title: "Area/ Street/ sector",
              controller: controller.areaCtr.value,
            ),
            VSpace(8),
            Row(
              children: [
                Expanded(
                    child: AppTextField(
                  title: "City/ Town",
                  controller: controller.cityCtr.value,
                )),
                HSpace(8),
                Expanded(
                  child: AppTextField(
                    title: "Pincode",
                    controller: controller.pincodeCtr.value,
                  ),
                )
              ],
            ),
            VSpace(16),
            Obx(() => InkWell(
                  onTap: () {
                    controller.isDefault(!controller.isDefault.value);
                  },
                  child: Row(
                    children: [
                      controller.isDefault.value
                          ? Icon(
                              Icons.radio_button_checked_rounded,
                              color: AppThemes.primary,
                            )
                          : Icon(Icons.radio_button_unchecked_rounded),
                      HSpace(5.0),
                      Text("Make this my default address.")
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
