import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:ui' as ui;

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();
  final language = "".obs;
  final store = GetStorage();

  String get currentLanguage => language.value;

  @override
  void onReady() async {
    //setInitialLocalLanguage();
    super.onInit();
  }

  // Retrieves and Sets language based on device settings
  setInitialLocalLanguage() {
    if (currentLanguageStore.value == '') {
      Locale deviceLanguage = ui.window.locale;
      debugPrint(ui.window.locale.toString());
      updateLanguage(deviceLanguage);
    }
  }

// Gets current language stored
  RxString get currentLanguageStore {
    language.value = store.read('language') ?? '';
    return language;
  }

  // gets the language locale app is set to
  Locale? get getLocale {
    if (currentLanguageStore.value == '') {
      language.value = 'en';
      updateLanguage(const Locale('en','US'));
    } else if (currentLanguageStore.value != '') {
      //set the stored string country code to the locale
      return Locale(currentLanguageStore.value);
    }
    // gets the default language key for the system.
    return Get.deviceLocale;
  }

// updates the language stored
  Future<void> updateLanguage(Locale value) async {
    Get.updateLocale(value);
    debugPrint("update locale $value");
    update();
    await store.write('language', value.languageCode);
  }
}
