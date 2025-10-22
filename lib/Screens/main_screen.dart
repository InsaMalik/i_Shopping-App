import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:shoppingapp/Controllers/Theme_controller.dart';
import 'package:shoppingapp/Controllers/navigator_controller.dart';
import 'package:shoppingapp/Screens/Widgets/custom_button_navbar.dart';
import 'package:shoppingapp/Screens/account_Screen.dart';
import 'package:shoppingapp/Screens/home_screen.dart';
import 'package:shoppingapp/Screens/shopping_Screen.dart';
import 'package:shoppingapp/Screens/wishlist_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final NavigatorController navigatorController= Get.find<NavigatorController>();
    return GetBuilder<ThemeController>(
      builder: (themeController)=>Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body:AnimatedSwitcher(
        duration:const Duration(milliseconds: 200),
        child: Obx(
          () => IndexedStack(
            key: ValueKey(navigatorController.currentIndex.value),
            index: navigatorController.currentIndex.value,
            children: [
              HomeScreen(),
              ShoppingScreen(),
              WishlistScreen(),
              AccountScreen(),
            ],
            ),
          )
        ),
        bottomNavigationBar: const CustomButtonNavbar(),
        ),
      );
  }
}