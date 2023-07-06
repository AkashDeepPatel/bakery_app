import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_field.dart';
import 'package:bakery_app/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/controllers/base_controller.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_text_button.dart';
import '../widgets/image_picker_dialog.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  ProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
        showAppBar: true,
        pageTitle: 'Profile Settings',
        // showBottomWidget: true,
        // bottomWidget: AppTextButton(text: 'Save', tit),
        child: Obx(() => ListView(
              children: [
                AppCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 4,
                                ),
                              ),
                              child: Obx(()=>Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: BaseController.getIcon(controller.profilePicUrl.value,"name", height: 100, width: 100, radius: 64)))
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 85.0),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    Get.dialog(const ImagePickDialog());
                                  },
                                  child: SvgPicture.asset('assets/home/icons/profile_image_edit.svg'),
                                )),
                          ),
                        ],
                      ),
                      // const VSpace(4),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       controller.username.value.text,
                      //       style: Theme.of(context).textTheme.labelLarge,
                      //     ),
                      //     const HSpace(5),
                      //     IconButton(
                      //       icon: const Icon(Icons.edit_note),
                      //       onPressed: () {},
                      //     ),
                      //   ],
                      // ),
                      const VSpace(16),
                      AppTextField(
                        title: "Full Name",
                        controller: controller.username.value,
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
                // const Padding(
                //   padding: EdgeInsets.only(left: 16.0),
                //   child: Text("Choose what you want to see "),
                // ),
                // ProfileController.getIcon('logo.svg', "name"),
                // Wrap(
                //   children: [
                //     AppCard(child: const Text("Breads")),
                //     AppCard(child: const Text("Cakes")),
                //     AppCard(child: const Text("Pizza")),
                //     AppCard(child: const Text("Pizza")),
                //     AppCard(child: const Text("Pizza")),
                //     AppCard(child: const Text("Pizza")),
                //   ],
                // )
              ],
            )));
  }
}
