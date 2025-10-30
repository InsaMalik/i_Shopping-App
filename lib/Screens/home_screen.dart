import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/Controllers/Theme_controller.dart';
import 'package:shoppingapp/Screens/All_products.dart';
import 'package:shoppingapp/Screens/Notification_screen.dart';
import 'package:shoppingapp/Screens/Widgets/Category_Chip.dart';
import 'package:shoppingapp/Screens/Widgets/Custom_searchbar.dart';
import 'package:shoppingapp/Screens/Widgets/Mycart_screen.dart';
import 'package:shoppingapp/Screens/Widgets/Products_gird.dart';
import 'package:shoppingapp/Screens/Widgets/Salebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('images/avatar.jpg'),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello Insa',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Good Evening',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Get.to(()=> NotificationScreen()),
                      icon: const Icon(Icons.notifications_none_outlined),
                    ),
                    IconButton(
                      onPressed: () =>Get.to(()=>MycartScreen()),
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                    GetBuilder<ThemeController>(
                      builder: (controller) => IconButton(
                        onPressed: () => controller.toggleTheme(),
                        icon: Icon(
                          controller.isDarkMode
                              ? Icons.light_mode
                              : Icons.dark_mode,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const CustomSearchbar(),
              const CategoryChip(),
              const Salebar(),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     "Popular Produsts",
                     style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                     ),
                    ),
                    GestureDetector(
                      onTap:()=> Get.to(()=> AllProducts()),
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color:Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                // Expanded(
                //   child: ProductsGird(),
                // ),
                SizedBox(
                height: 500,
                child: ProductsGird(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
