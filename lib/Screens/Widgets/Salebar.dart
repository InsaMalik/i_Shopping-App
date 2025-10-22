import 'package:flutter/material.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class Salebar extends StatelessWidget {
  const Salebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Your',
                  style: AppTextStyle.withColor(
                  AppTextStyle.h3,
                  Colors.white
                ),
                ),
                Text(
                  'Special Sale',
                  style: AppTextStyle.withColor(
                  AppTextStyle.withWight(AppTextStyle.h2,
                  FontWeight.bold),
                  Colors.white
                ),
                ),
                Text(
                  'Up to 45% off',
                  style: AppTextStyle.withColor(
                  AppTextStyle.h3,
                  Colors.white
                ),
                ),
              ],
            ),
          ),

          ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
           child: Text(
            "Shop Now",
            style: AppTextStyle.MediumButton,
           ),
           ),
        ],
      ),
    );
  }
}