import 'package:bakery_app/splash/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/app_routes.dart';
import 'common/bindings/bindings.dart';
import 'common/styles/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppBindings().dependencies();
  // await GetStorage.init();
  runApp(
    DevicePreview(
      enabled: false,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.keepFactory,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
      initialRoute: SplashScreen.routeName,
      getPages: AppRoutes.routes,
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
    );
  }
}
