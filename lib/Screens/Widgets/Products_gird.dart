import 'package:flutter/material.dart';
import 'package:shoppingapp/Screens/Product_detail_screen.dart';
import 'package:shoppingapp/Screens/Widgets/product_card.dart';
import 'package:shoppingapp/models/Products.dart';

class ProductsGird extends StatelessWidget {
  const ProductsGird({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      shrinkWrap: true, // ✅ 
      physics: const NeverScrollableScrollPhysics(), // ✅ 
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context,index){
        final product =products[index];
        return GestureDetector(
          onTap:()=>Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=> ProductDetailScreen(product: product,)),
            ),
          child: ProductCard(product: product),
        );
      },
    );
  }
}