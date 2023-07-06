import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/localization/localization.g.dart';
import '../../common/screens/common_base_class.dart';
import '../../common/styles/app_themes.dart';
import '../controllers/user_preferences_controller.dart';

class LanguageScreen extends GetView<UserPreferencesController> {
  LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      // pageTitle: "Choose Language",
      pageTitle: Localization.languageScreenChooseLanguage.tr,
      showActionButtons: false,
      child: ListView.separated(
        itemCount: controller.languageList.length,
        separatorBuilder: (context, index){
          return SizedBox(height: 8);
        },
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              controller.selectLanguage(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.languageList[index][2]),
                  controller.selectedLanguageIndex.value == index? Icon(Icons.check_circle_outline_outlined, color: AppThemes.primary,): SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}



