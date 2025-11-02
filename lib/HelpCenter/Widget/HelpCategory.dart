import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/HelpCenter/Widget/Category_card.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class HelpCategoriesSection extends StatelessWidget {
  const HelpCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Categories=[
      {"icon":Icons.shopping_bag_outlined,"Title":"Orders"},
      {"icon":Icons.payment_outlined,"Title":"Payment"},
      {"icon":Icons.local_shipping_outlined,"Title":"Shipping"},
      {"icon":Icons.assignment_return_outlined,"Title":"Returns"},

    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(
          " Help Categories",
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
         ),
         const SizedBox(height: 16),
         GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
            ),
            itemCount: Categories.length,
          itemBuilder: (context,index){
            return CategoryCard(
              title: Categories[index]["Title"] as String,
              icon: Categories[index]["icon"] as IconData,
            );
          },
          )
        ],
      )
      );
  }
}