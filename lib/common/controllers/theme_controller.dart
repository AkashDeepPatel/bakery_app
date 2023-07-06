import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../styles/app_themes.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  final theme = "system".obs;
  final store = GetStorage();
  late ThemeMode _themeMode;
  final RxBool blackTheme = false.obs;

  ThemeMode get themeMode => _themeMode;

  String get currentTheme => theme.value;

  Future<void> setThemeMode(String value) async {
    theme.value = value;
    _themeMode = getThemeModeFromString(value);
    Get.changeThemeMode(_themeMode);
    await store.write('theme', value);
    update();
  }

  ThemeMode getThemeModeFromString(String themeString) {
    ThemeMode setThemeMode = ThemeMode.system;
    if (themeString == 'light') {
      setThemeMode = ThemeMode.light;
    }
    if (themeString == 'dark') {
      setThemeMode = ThemeMode.dark;
    }
    return setThemeMode;
  }

  @override
  void onInit() {
    getThemeMode();
    super.onInit();
  }

  // Gets current currency stored
  RxBool get getThemeMode {
    blackTheme.value = store.read('themeMode') ?? false;
    return blackTheme;
  }

  updateTheme(bool value) async {
    blackTheme.value = value;
    await store.write('themeMode', value);
    Get.changeTheme(value ? AppThemes.darkTheme : AppThemes.lightTheme);
  }

  getThemeModeFromStore() async {
    String themeString = store.read('theme') ?? 'light';
    setThemeMode(themeString);
  }

  // checks whether darkmode is set via system or previously by user
  bool get isDarkModeOn {
    if (currentTheme == 'system') {
      if (WidgetsBinding.instance.window.platformBrightness ==
          Brightness.dark) {
        return true;
      }
    }
    if (currentTheme == 'dark') {
      return true;
    }
    return false;
  }
}
