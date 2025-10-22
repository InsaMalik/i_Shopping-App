import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shoppingapp/Screens/Widgets/selected_Sized.dart';
import 'package:shoppingapp/models/Products.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class ProductDetailScreen extends StatelessWidget {
  final Products product;
 ProductDetailScreen({super.key,
  required this.product
  });

  @override
  Widget build(BuildContext context) {
    final screenSize =MediaQuery.of(context).size;
    final screenHeight=screenSize.height;
    final screenWidth=screenSize.width;
    final isDark=Theme.of(context).brightness ==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detials',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
             isDark? Colors.white : Colors.black,
             ),
        ),
        actions: [
          IconButton(
            onPressed: ()=> _shareProduct(context,
            product.name,
            product.description,
            ),
            icon: Icon(Icons.share,
            color: isDark ? Colors.white : Colors.black,),
          )
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16/9,
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  ),
                
                Positioned(
                  child: IconButton(onPressed: (){},
                  icon: Icon(
                    product.isfavorite ?
                    Icons.favorite:Icons.favorite_border,
                    color:product.isfavorite ?
                    Theme.of(context).primaryColor:
                    (isDark ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
            padding: EdgeInsets.all(screenWidth*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style: AppTextStyle.withColor(
                        AppTextStyle.h2,
                       Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                    ),
                  ),
                  Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: AppTextStyle.withColor(
                        AppTextStyle.h2,
                       Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                    ),
                ],
                ),
                Text(
                      product.category,
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyTextMedium,
                      isDark? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                SizedBox(height: screenHeight*0.02,),
                Text(
                  'Selected Sized',
                   style: AppTextStyle.withColor(
                   AppTextStyle.MediumLable,
                   Theme.of(context).textTheme.bodyLarge!.color!,
                   ),
                ),
                SizedBox(height: screenHeight*0.01,),
                 SelectedSized(),
                SizedBox(height: screenHeight*0.02,),
                 Text(
                  'Description:',
                   style: AppTextStyle.withColor(
                   AppTextStyle.MediumLable,
                   Theme.of(context).textTheme.bodyLarge!.color!,
                   ),
                ),
                SizedBox(height: screenHeight*0.01,),
                Text(
                      product.description,
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyTextSmall,
                      isDark? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
              ],
            ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth*0.04),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                onPressed: (){},
                style:OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth*0.02,
                  ),
                  side: BorderSide(
                    color:isDark ? Colors.white70:Colors.black12,
                  ),
                ),
                child: Text(
                  'Add To Cart',
                  style: AppTextStyle.withColor(
                    AppTextStyle.MediumButton,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
               ),
              ),
              SizedBox(width: screenWidth*0.02,),
               Expanded(
                child: ElevatedButton(
                onPressed: (){},
                style:ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth*0.02,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'Buy Now',
                  style: AppTextStyle.withColor(
                    AppTextStyle.MediumButton,
                    Colors.white,
                    ),
                  ),
               ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _shareProduct(
  BuildContext context,
  String name,String description)async{
    final box= context.findRenderObject() as RenderBox?;
    const String shoplink="https://I_shop.com/products/";
    final String ShareMessage='$description\n$shoplink\n$name';
    try{
      final ShareResult result= await Share.share(
        ShareMessage,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
      if(result.status==ShareResultStatus.success){
        debugPrint("Thank you for sharing!");
      }
    }catch(e){
      debugPrint("some thing went wrong please try again!");
    }
}
}