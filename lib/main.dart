import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoppingapp/Controllers/Auth_controller.dart';
import 'package:shoppingapp/Controllers/Theme_controller.dart';
import 'package:shoppingapp/Controllers/navigator_controller.dart';
import 'package:shoppingapp/Screens/SplashScreen.dart';
import 'package:shoppingapp/utilities/App_ThemeColor.dart';


void main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(AuthController());
  Get.put(NavigatorController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  final themeController= Get.find<ThemeController>();
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Store',
      theme: AppThemecolor.light,
      darkTheme: AppThemecolor.Dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,
      home: Splashscreen() ,
    );
  }
}
