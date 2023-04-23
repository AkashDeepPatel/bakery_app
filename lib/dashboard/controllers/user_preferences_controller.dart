

import 'package:bakery_app/dashboard/controllers/language_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/controllers/base_controller.dart';

class UserPreferencesController extends BaseController {
  final store = GetStorage();
  RxString currentCurrency = ''.obs;
  RxString currentLanguage = ''.obs;

  Rx<TextEditingController> languageSearchCtr = TextEditingController().obs;

  RxInt selectedLanguageIndex = 0.obs;

  List languageList = [
    ["assets/languageFlags/US.svg", "en", "English (EN)", const Locale('en', 'US')],
    ["assets/languageFlags/IN.svg", "hi", "Hindi (HI)", const Locale('hi', 'IN')],
    ["assets/languageFlags/NZ.svg", "fr", "French (FR)", const Locale('fr', 'FR')],
  ];


  selectLanguage(int selectedIndex) async {
    selectedLanguageIndex.value = selectedIndex;
    currentLanguage.value = languageList[selectedIndex][1];
    await Get.find<LanguageController>()
        .updateLanguage(languageList[selectedIndex][3]);
    updateUserPreferences();
    Get.snackbar("Language updated successfully", "");
  }

  selectTheme() {
    updateUserPreferences();
  }

  updateUserPreferences({bool isAppUpdate = false}) async {
    change(null, status: RxStatus.loading());
    try {
        change(null, status: RxStatus.success());
    } on DioError catch (e) {
      debugPrint("${e.response!.statusMessage}");
      e.response!.statusCode == 404
          ? change(null, status: RxStatus.empty())
          : change(null, status: RxStatus.error());
    }
  }

  @override
  onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
    currentLanguage.value = store.read('language') ?? "";
    int language = languageList
        .indexWhere((element) => element[1] == currentLanguage.toLowerCase());
    selectedLanguageIndex.value = language.isNegative ? 0 : language;
  }
}

