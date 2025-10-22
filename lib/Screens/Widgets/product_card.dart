import 'package:flutter/material.dart';
import 'package:shoppingapp/models/Products.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class ProductCard extends StatelessWidget {
  final Products product;
  ProductCard({super.key,
  required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth =MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: BoxConstraints(
        maxWidth: screenWidth *0.9,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color:isDark? Colors.black.withOpacity(0.3):Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  product.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child:  IconButton(
                  icon: Icon(
                    product.isfavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isfavorite ? Theme.of(context).primaryColor:
                    isDark? Colors.grey[400]: Colors.grey[600],
                  ),
                  onPressed: () {},
                ),
              ),
            if(product.oldprice!=null)
              Positioned(
                top:8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${CalucateDiscount(product.price, product.oldprice!)}%off',
                    style: AppTextStyle.withColor(
                      AppTextStyle.withWight(
                        AppTextStyle.bodyTextSmall,
                      FontWeight.bold,)
                      ,Colors.white
                      ),
                  ),
                )
              ),
            
          ],
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth*0.02,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: AppTextStyle.withColor(
               AppTextStyle.withWight(
                  AppTextStyle.h3,
                      FontWeight.bold,),
                      Theme.of(context).textTheme.bodyLarge!.color!,
               ),
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height:screenWidth*0.01),
              Text(
                 product.category,
                 style: AppTextStyle.withColor(
                    AppTextStyle.bodyTextMedium,
                    isDark?Colors.grey[400]!:Colors.grey[600]!,),
              ),
              SizedBox(height: screenWidth*0.01,),
              Row(
                children: [
                  Text('\$${product.price.toStringAsFixed(2)}',
                  style:  AppTextStyle.withColor(
               AppTextStyle.withWight(
                  AppTextStyle.bodyTextLarge,
                      FontWeight.bold,),
                      Theme.of(context).textTheme.bodyLarge!.color!,
               ), 
               ),
               if(product.oldprice!=null)...[
                 SizedBox(width: screenWidth*0.01,),
                 Text('\$${product.oldprice!.toStringAsFixed(2)}',
                  style:  AppTextStyle.withColor(
                  AppTextStyle.bodyTextSmall,
                    isDark?Colors.grey[400]!:Colors.grey[600]!,
               ).copyWith(
                decoration: TextDecoration.lineThrough,
               ), 
               ),
               ]
              
                ],
              )
            ],
          ),
          ),
      ],
     ),

    );
  }

  int CalucateDiscount(double currentPrice, double oldPrice) {
   return (((oldPrice - currentPrice) / oldPrice * 100).round());
  }
}