import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/models/Products.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class MycartScreen extends StatelessWidget {
  const MycartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(),
         icon: Icon(Icons.arrow_back,
         color: isDark ? Colors.white : Colors.black,),
         ),
        title: Text(
          "My Cart",
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
             isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context,index)=>_buildCartItem(
              context,
              products[index],
              ),
              ),
          ),
          _buildCartSummery(context),
        ],
      )
    );
  }
  Widget _buildCartItem(BuildContext context,Products product) {
    final isDark=Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      // padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:isDark ? Colors.black.withOpacity(0.2):Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.asset(
              product.imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          // const SizedBox(width: 16,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Expanded(
                      child: Text(
                        product.name,
                        style: AppTextStyle.withColor(
                          AppTextStyle.bodyTextLarge,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                    ),
                    IconButton(
                    onPressed: ()=>_showDeleteConfirmationDialog(context,product),
                     icon: Icon(
                      Icons.delete_outlined,
                      color: Colors.red[400],
                     ),
                    ),
                  ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: AppTextStyle.withColor(
                          AppTextStyle.h3,
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                            onPressed: (){},
                             icon: Icon(
                              Icons.remove,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                             ),
                            ),
                            Text(
                              '1',
                              style: AppTextStyle.withColor(
                                AppTextStyle.bodyTextLarge,
                                Theme.of(context).textTheme.bodyLarge!.color!,
                              ),
                            ),
                            IconButton(onPressed: (){},
                             icon: Icon(
                              Icons.add,
                              color: Theme.of(context).primaryColor,
                             ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showDeleteConfirmationDialog(BuildContext context,Products product) {
    final isDark=Theme.of(context).brightness == Brightness.dark;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[400]!.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outlined,
                color: Colors.red[400],
                size: 32,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Remove Item',
              style: AppTextStyle.withColor(
                AppTextStyle.h3,
                isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Are you sure you want to remove this item from your cart?',
              textAlign: TextAlign.center,
              style: AppTextStyle.withColor(
                AppTextStyle.bodyTextMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(
                      color: isDark? Colors.white70: Colors.black12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                    child: Text(
                      'Cancel',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyTextMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      // side: BorderSide(
                      //   color: isDark? Colors.white70: Colors.black12,
                      // ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Remove',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyTextMedium,
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      barrierColor:Colors.black,
    );
  }

Widget _buildCartSummery(BuildContext context){
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black .withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, -5),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total (4 items)",
              style: AppTextStyle.withColor(
                AppTextStyle.bodyTextMedium,
               Theme.of(context).textTheme.bodyLarge!.color!,
               ),
            ),
            Text(
              "\$ 705.00",
              style: AppTextStyle.withColor(
                AppTextStyle.h2,
               Theme.of(context).primaryColor,
               ),
            ),
          ],
        ),
        const SizedBox(height: 16,),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
           onPressed: (){},
           style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
           ), 
           child: Text(
            "Check_Out",
            style: AppTextStyle.withColor(
                AppTextStyle.MediumButton,
               Colors.white,
               ),
            ),
           ),
        ),
      ],
    ),
  );
}
}