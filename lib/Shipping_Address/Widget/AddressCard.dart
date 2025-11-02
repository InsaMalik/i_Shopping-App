import 'package:flutter/material.dart';
import 'package:shoppingapp/Shipping_Address/model/Address.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class Addresscard extends StatelessWidget {
  final Address address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const Addresscard({
    super.key,
    required this.address,
    required this.onEdit,
    required this.onDelete,
    });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsetsGeometry.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color:Theme.of(context).primaryColor.withOpacity(0.1),
                   borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.location_on,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                     children: [
                      Text(
                        address.label,
                        style: AppTextStyle.withColor(
                        AppTextStyle.h3,
                         Theme.of(context).textTheme.bodyLarge!.color!),
                      ),
                      if(address.isDefault)...{
                        const SizedBox(width: 8,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                          decoration: BoxDecoration(
                            color:Theme.of(context).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Default",
                            style: AppTextStyle.withColor(
                              AppTextStyle.bodyTextSmall,
                              Theme.of(context).primaryColor),
                            ),
                        ),
                      },
                     ],
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      '${address.fulladdress}\n${address.city}, ${address.state}, ${address.zipCode}',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyTextMedium,
                        isDark ? Colors.grey[400]! :Colors.grey[600]!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ),
          Divider(height: 1,color: Colors.grey.shade200,),
          Row(children: [
            Expanded(
              child:InkWell(
                onTap: onEdit,
                child: Padding(padding: EdgeInsets.symmetric( vertical: 12),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      color: Theme.of(context).primaryColor,
                      size:20,
                    ),
                    const SizedBox(width: 8,),
                    Text(
                      'Edit',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyTextMedium,
                        Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
                ),
              ), 
            ),
            Container(
            width: 1,
            color: Colors.grey.shade200,
            ),
             Expanded(
              child:InkWell(
                onTap:onDelete,
                child: Padding(padding: EdgeInsets.symmetric( vertical: 12),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete_outlined,
                      color: Colors.red,
                      size:20,
                    ),
                    const SizedBox(width: 8,),
                    Text(
                      'Delete',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyTextMedium,
                        Colors.red,
                      ),
                    )
                  ],
                ),
                ),
              ), 
            ),
          ],
          ),
        ],
      ),
    );
  }
}