import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_field.dart';
import 'package:bakery_app/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../../common/widgets/app_card.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  ProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
        showAppBar: true,
        child: Obx(() => ListView(
              children: [
                AppCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        CommonAssets.circularPlaceholder,
                        height: 90,
                      ),
                      const VSpace(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.username.value.text,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const HSpace(5),
                          IconButton(
                            icon: const Icon(Icons.edit_note),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const VSpace(16),
                      Obx(
                        () => AppTextField(
                          title: "Edit Email",
                          controller: controller.email.value,
                        ),
                      ),
                      const VSpace(20),
                      AppTextField(
                        title: "Edit Phone Number",
                        controller: controller.phoneNo.value,
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
                const VSpace(20),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text("Choose what you want to see "),
                ),
                // ProfileController.getIcon('logo.svg', "name"),
                Wrap(
                  children: [
                    AppCard(child: const Text("Breads")),
                    AppCard(child: const Text("Cakes")),
                    AppCard(child: const Text("Pizza")),
                    AppCard(child: const Text("Pizza")),
                    AppCard(child: const Text("Pizza")),
                    AppCard(child: const Text("Pizza")),
                  ],
                )
              ],
            )));
  }
}
