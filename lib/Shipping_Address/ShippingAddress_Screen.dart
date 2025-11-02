import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingapp/Shipping_Address/Repository/address_repositories.dart';
import 'package:shoppingapp/Shipping_Address/Widget/AddressCard.dart';
import 'package:shoppingapp/Shipping_Address/model/Address.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class ShippingaddressScreen extends StatelessWidget {
  final AddressRepositories _repository = AddressRepositories();
  ShippingaddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark =Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> Get.back(),
           icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
            ),
            ),
        title: Text(
          "Shipping Address",
          style: AppTextStyle.withColor(
          AppTextStyle.h3,
          isDark ? Colors.white : Colors.black,
        ),
        ),
        actions: [
          IconButton(onPressed: ()=> _showAddAddressBottomsheet(context),
           icon: Icon(
            Icons.add_circle_outlined,
            color: isDark ? Colors.white : Colors.black,
            ),
            ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _repository .getAddresses().length,
        itemBuilder: (context,index)=> _buildAddressCard(context,index),
        ),
    );
  }
  Widget _buildAddressCard(BuildContext context,int index){
    final address = _repository.getAddresses()[index];
    return Addresscard(
      address: address,
      onEdit: () => _showEditAddressBottomsheet(context, address),
      onDelete: () => _showDeleteConfirmation(context),
    );
  }
  void _showEditAddressBottomsheet(BuildContext context,Address address){
    final isDark =Theme.of(context).brightness == Brightness.dark;
    Get.bottomSheet(
    Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top:Radius.circular(20),),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
            'Edit Address',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          IconButton(
            onPressed: ()=> Get.back(),
             icon: Icon(
              Icons.close,
              color: isDark ? Colors.white : Colors.black,
             ),
             ),
          ],
         ),
         const SizedBox(height: 24,),
         _buildTextField( 
          context,
          'Label e.g( Home, Office)',
          Icons.label_outlined,
          initialValue: address.label,
         ),
         const SizedBox(height: 16,),
         _buildTextField( 
          context,
          'FullAddress',
          Icons.location_on_outlined,
          initialValue: address.fulladdress,
         ),
         const SizedBox(height: 16,),
         _buildTextField( 
          context,
          'City',
          Icons.location_city_outlined,
          initialValue: address.city,
         ),
         const SizedBox(height: 16,),
         Row(
          children:[
          Expanded(
            child: _buildTextField(
              context,
              'State',
              Icons.map_outlined,
              initialValue: address.state
              ),
            ),
            const SizedBox(width: 16,),
            Expanded(
            child: _buildTextField(
              context,
              'ZIP Code',
              Icons.pin_outlined,
              initialValue: address.zipCode,
              ),
            ),
          ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),
             child: Text(
              'Update Address',
              style: AppTextStyle.withColor(
                AppTextStyle.MediumButton,
                Colors.white),
             ),
             ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
    isScrollControlled: true,
    );
  }

  void _showDeleteConfirmation(BuildContext context){
   final isDark =Theme.of(context).brightness == Brightness.dark;
   Get.dialog(
    AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
        ),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              shape:BoxShape.circle,
            ),
            child: Icon(
              Icons.delete_outline,
              color: Colors.red,
              size: 32,
            ),
            ),
            const SizedBox(height: 16),
            Text(
              'Delete Address ?',
              style: AppTextStyle.withColor(
                AppTextStyle.h3,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Are you sure you want to delete this address ?',
              textAlign: TextAlign.center,
              style: AppTextStyle.withColor(
                AppTextStyle.bodyTextMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                  onPressed: ()=>Get.back(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(
                     color:  isDark ? Colors.grey[700]! : Colors.grey[300]!,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ), 
                  child: Text(
                    'cancel',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyTextMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  )
                  ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                  child: ElevatedButton(
                  onPressed: (){
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ), 
                  child: Text(
                    'Delete',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyTextMedium,
                      Colors.white,
                    ),
                  )
                  ),
                  ),
              ],
            ),
          ],
        ),
    ),
    barrierColor: Colors.black,
   );
  }
  Widget _buildTextField(
    BuildContext context,
    String label,
    IconData icon,{String? initialValue}
  )
  {
  final isDark =Theme.of(context).brightness == Brightness.dark;
  return TextFormField(
  initialValue: initialValue,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon,color: Theme.of(context).primaryColor,),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color:isDark ? Colors.grey[700]!:Colors.grey[300]!,
     ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
       color:isDark ? Colors.grey[700]!:Colors.grey[300]!,
     ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
       color: Theme.of(context).primaryColor,
     ),
    ),
  ),
  );
}
void _showAddAddressBottomsheet(BuildContext context){
  final isDark =Theme.of(context).brightness == Brightness.dark;
  Get.bottomSheet(
   Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
    ),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Text(
          'Add New Address',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
         ),
         IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(
          Icons.close,
          color: isDark?Colors.white:Colors.black,
          ),
          ),
      ],
      ),
      const SizedBox(height: 24,),
      _buildTextField(
        context,
       'Label e.g(Home,Office)',
        Icons.label_outlined
        ),
      const SizedBox(height: 16),
      _buildTextField(
        context,
       'Full Address',
       Icons.location_on_outlined
       ),
      const SizedBox(height: 16,),
      _buildTextField(
        context,
       'City',
        Icons.location_city_outlined
      ),
      const SizedBox(height: 16,),
      Row(
        children: [
          Expanded
          (
            child: _buildTextField(
              context,
              'State',
              Icons.map_outlined
             ),
          ),
          const SizedBox(width: 16),
          Expanded
          (
            child: _buildTextField(
              context,
              'ZIP code',
              Icons.pin_outlined
             ),
          ),
        ],
      ),
      const SizedBox(height: 24),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
        onPressed: (){
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
          ),

        ),
         child: Text(
          'Save Address',
          style: AppTextStyle.withColor(
            AppTextStyle.bodyTextMedium,
            Colors.white,
          ),
         ),
        ),
      )
    ],
    ),
   ),
  );
}
}