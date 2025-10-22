
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/Controllers/navigator_controller.dart';

class CustomButtonNavbar extends StatefulWidget {
  const CustomButtonNavbar({super.key});

  @override
  State<CustomButtonNavbar> createState() => _CustomButtonNavbarState();
}

class _CustomButtonNavbarState extends State<CustomButtonNavbar> {
  @override
  Widget build(BuildContext context) {
    final NavigatorController navigatorController =Get.find<NavigatorController>();
    return Obx(
      () => BottomNavigationBar(
        currentIndex:navigatorController.currentIndex.value,
        onTap: (index)=> navigatorController.changeIndex(index),
        items: const[
          BottomNavigationBarItem(
            icon:Icon(Icons.home_outlined),
            label: "Home",
            ),
            BottomNavigationBarItem(
            icon:Icon(Icons.shopping_bag_outlined),
            label: "Shopping Cart",
            ),
            BottomNavigationBarItem(
            icon:Icon(Icons.favorite_border_outlined),
            label: "Wishlist",
            ),
            BottomNavigationBarItem(
            icon:Icon(Icons.person_outline),
            label: "Account",
            ),
        ],
      ),
    );
  }
}