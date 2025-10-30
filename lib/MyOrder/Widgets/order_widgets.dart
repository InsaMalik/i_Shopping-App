import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:shoppingapp/MyOrder/Screen/Model/My_Order%20Model.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class Ordercard extends StatelessWidget {
  final Order order;
  final VoidCallback onViewDetails;
 Ordercard({super.key,
 required this.order,
 required this.onViewDetails
 });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness==Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
           decoration: BoxDecoration(
            color : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: isDark 
                ? Colors.black.withOpacity(0.2)
                :Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
           ),
           child: Column(
            children: [
             Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                       borderRadius :BorderRadius.circular(12),
                    image:DecorationImage(
                      image: AssetImage(order.imageUrl),
                      fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order # ${order.OrderNumber}',
                          style: AppTextStyle.withColor(
                            AppTextStyle.h3,
                            Theme.of(context).textTheme.bodyLarge!.color!,
                          ),
                        ),
                        const SizedBox(height: 4,),
                        Text(
                          '${order.itemCount} Items .\$${order.totalAmount.toStringAsFixed(2)}',
                          style: AppTextStyle.withColor(
                            AppTextStyle.bodyTextMedium,
                            isDark ? Colors.grey[400]! :Colors.grey[600]!,
                          ),
                        ),
                        const SizedBox(height: 8,),
                        _buildStatuschip(
                          context,
                          order.StatusString,
                        ),
                      ],
                    ),
                    ),
                ],
              ),
             ),
           ],),
    );
  }
  Widget _buildStatuschip(BuildContext context, String type){
    Color getStatusColor(){
      switch(type){
        case 'active':
          return Colors.blue;
        case 'completed':
          return Colors.green;
        case 'cancelled':
          return Colors.red;
        default:
          return Colors.grey;
      } 
    }
    return Container(
   padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
    decoration: BoxDecoration(
      color: getStatusColor().withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      type.capitalize!,
      style: AppTextStyle.withColor(
        AppTextStyle.bodyTextMedium,
        getStatusColor(),
      ),
    )
    );
  }
}