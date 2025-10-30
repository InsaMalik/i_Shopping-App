
import 'package:flutter/material.dart';
import 'package:shoppingapp/models/Products.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness ==Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style:AppTextStyle.withColor(
            AppTextStyle.h3,
           isDark ? Colors.white:Colors.black,
           ),
        ),
        actions: [
          IconButton(onPressed: (){},
          icon: Icon(Icons.search),
          color: isDark ? Colors.white:Colors.black,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
           child: _buildSummarySection(context),
          ),
          SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(delegate: SliverChildBuilderDelegate(
            (context,index)=> _bildWishListItem(
             context,
             products.where((p)=>p.isfavorite).toList()[index],
            ),
            childCount: products.where((p)=> p.isfavorite).length
          ),
          ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context){
    final isDark = Theme.of(context).brightness==Brightness.dark;
    final favoriteProducts = products.where((p)=>p.isfavorite).length;
    return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: isDark ? Colors.grey[850]: Colors.grey[100],
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16),),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
          '$favoriteProducts Items',
          style: AppTextStyle.withColor(
            AppTextStyle.h2,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        const SizedBox(height: 4,),
        Text(
          'in your Wishlist',
          style: AppTextStyle.withColor(
            AppTextStyle.bodyTextMedium,
            isDark? Colors.grey[400]! :Colors.grey[600]!,
          ),
        ),
        ],
       ),
       ElevatedButton(onPressed: (){},
       style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
       ),
       child: Text('Add to Cart',
       style: AppTextStyle.withColor(
        AppTextStyle.bodyTextMedium,
        Colors.white,
       ),
       ),
       )
      ],
    ),
  );
 }
 Widget _bildWishListItem(BuildContext context,Products product){
  final isDark = Theme.of(context).brightness==Brightness.dark;
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: isDark ? Colors.black.withOpacity(0.2):Colors.grey.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(12),),
        child: Image.asset(
          product.imageUrl,
          width:120 ,
          height: 120,
          fit:BoxFit.cover,
        ),
        ),
        Expanded(
          child: Padding(padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyTextLarge,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 4,),
              Text(
                product.category,
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyTextSmall,
                  isDark ? Colors.grey[400]!: Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: AppTextStyle.withColor(
                      AppTextStyle.h3,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){},
                       icon: Icon(Icons.shopping_cart_outlined,
                       color:Theme.of(context).primaryColor,
                       ),
                       ),
                      IconButton(onPressed: (){},
                       icon: Icon(Icons.delete_outline,
                       color:isDark ? Colors.grey[400]!:Colors.grey[600]!,
                       ),
                       ),
                    ],
                  )
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
}