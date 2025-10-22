import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class FilterBottomsheet {
  static void show(BuildContext context){
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, //
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top:Radius.circular(20),
        ),
        ),
       builder: (context)=>StatefulBuilder(
        builder: (context,setState)=>Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filter Products",
                style: AppTextStyle.withColor(
                AppTextStyle.h3,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
              ),
              IconButton(onPressed: ()=>Get.back(),
              icon: Icon(
                Icons.close,
                color: isDark ? Colors.white : Colors.black,
              ),
              ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Price Range',
            style: AppTextStyle.withColor(
            AppTextStyle.bodyTextLarge,
            Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Min",
                      prefixText: "\$",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                        color:isDark? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  )
                  ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Max",
                      prefixText: "\$",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                        color:isDark? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  )
                  ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Categories',
            style: AppTextStyle.withColor(
            AppTextStyle.bodyTextLarge,
            Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'All',
                'Shoes',
                'Electronics',
                'Footware',
                'Clothing',
                'Jewellery',
                'Accessories',
              ].map((category)=>FilterChip(
                label:Text(category),
                selected : category == 'All',
                onSelected:(selected){},
                backgroundColor:Theme.of(context).cardColor,
                selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                labelStyle: AppTextStyle.withColor(
                   AppTextStyle.bodyTextMedium,
                   category=='All'? Theme.of(context).primaryColor :
                   Theme.of(context).textTheme.bodyLarge!.color!,
                ),

              )).toList(),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width:double.infinity,
              child: ElevatedButton(
                onPressed: ()=> Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Apply Filter",
                   style: AppTextStyle.withColor(
                   AppTextStyle.MediumButton,
                   Colors.white,
              ),
                  ),
              ),
            )
          ],
        ),
        ),
        ),
       );
  }
}
