import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingapp/Screens/Widgets/Category_Chip.dart';
import 'package:shoppingapp/Screens/Widgets/Products_gird.dart';
import 'package:shoppingapp/Screens/Widgets/filter_bottomsheet.dart';
import 'package:shoppingapp/Screens/home_screen.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
     final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(onPressed: ()=> Get.off(()=>HomeScreen()),
       icon: Icon(
        Icons.arrow_back_ios,
        color: isDark ? Colors.white : Colors.black,
        ),
      ),
        title: Text(
          "Shopping ",
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top:16),
            child: CategoryChip(),
            ),
            Expanded(
              child: ProductsGird(),
            ),
        ],
      ),
    );
  }
}