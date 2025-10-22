import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/Screens/Widgets/Products_gird.dart';
import 'package:shoppingapp/Screens/Widgets/filter_bottomsheet.dart';
import 'package:shoppingapp/Screens/home_screen.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.off(()=>HomeScreen()),
         icon: Icon(
          Icons.arrow_back_ios,
          color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          "All Products",
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(onPressed: (){},
           icon: Icon(
            Icons.search,
            color: isDark ? Colors.white : Colors.black,
           ),
          ),
           IconButton(onPressed: ()=> FilterBottomsheet.show(context),
           icon: Icon(
            Icons.filter_list,
            color: isDark ? Colors.white : Colors.black,
           ),
          ),
        ],
      ),
      body: const ProductsGird(),
    );
  }
}