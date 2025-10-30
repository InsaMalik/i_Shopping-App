import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingapp/Controllers/Auth_controller.dart';
import 'package:shoppingapp/MyOrder/Screen/My_order_screen.dart';
import 'package:shoppingapp/Screens/Setting_Screen.dart';
import 'package:shoppingapp/Screens/signIn_screen.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'My Account',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white: Colors.black,
          ),
        ),
        actions: [
          IconButton(onPressed: ()=> Get.to(()=> settingScreen()),
          icon: Icon(Icons.settings_outlined),
          color: isDark ? Colors.white:Colors.black,
          ),
        ],
      ),
     body: SingleChildScrollView(
      child: Column(
        children: [
          _buildProfileSection(context),
          const SizedBox(height: 24,),
          _buildMenuSection(context),
        ],
      ),
     ),
   );
  }
  Widget _buildProfileSection(BuildContext context){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
     width: double.infinity,
     padding: const EdgeInsets.all(16),
     decoration: BoxDecoration(
      color: isDark ? Colors.grey[850] :Colors.grey[100],
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(24),),
     ),
     child: Column(
      children: [
        CircleAvatar(
         radius: 50,
         backgroundImage: const AssetImage('images/avatar.jpg'),
        ),
        const SizedBox(height: 16,),
        Text(
          "Insa Malik",
          style: AppTextStyle.withColor(
            AppTextStyle.h2,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        const SizedBox(height: 4,),
         Text(
          "Insamalik@gmail.com",
          style: AppTextStyle.withColor(
            AppTextStyle.bodyTextMedium,
            isDark ? Colors.grey[400]! :Colors.grey[600]!,
          ),
        ),
        const SizedBox(height: 16,),
        OutlinedButton(
        onPressed: (){},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32,vertical:12),
          side: BorderSide(
            color: isDark ? Colors.white70 :Colors.black12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )
        ),
        child: Text(
          "Edit Profile",
          style: AppTextStyle.withColor(
           AppTextStyle.bodyTextMedium,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        ),
        
      ],
     ),
    );
  }
  Widget _buildMenuSection(BuildContext context){
    final isDark = Theme.of(context).brightness == Brightness.dark; 
    final menuItems=[
      {'icon':Icons.shopping_bag_outlined,'Title':"My Orders"},
      {'icon':Icons.location_on_outlined,'Title':"Shipping Address"},
      {'icon':Icons.help_outlined,'Title':"Help Center"},
      {'icon':Icons.logout_outlined,'Title':"Logout"},
    ];
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: menuItems.map((item){
          return Container(
           margin: EdgeInsets.only(bottom: 16),
           decoration: BoxDecoration(
            color : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black.withOpacity(0.2):Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
           ),
           child: ListTile(
            leading: Icon(item['icon'] as IconData,
            color: Theme.of(context).primaryColor,
            ),
            title: Text(item['Title'] as String,
            style: AppTextStyle.withColor(
              AppTextStyle.bodyTextMedium,
             Theme.of(context).textTheme.bodyLarge!.color!),
             ),
            trailing: Icon(
              Icons.chevron_right,
              color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
              onTap: (){
                if(item['Title'] == "Logout"){
                  _showLogoutDialog(context);
                }
                else if (item['Title'] == "My Orders")
                {
                Get.to(() => MyOrderScreen());
                }
                else if(item['Title'] == "Shipping Address")
                {

                }
                else if(item['Title'] == "Help Center")
                {}
              },
           ),
          );
        }).toList()
      ),
    );
  }
  void _showLogoutDialog(BuildContext context){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Get.dialog(
      AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:Theme.of(context).primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.logout_rounded,
              color:Theme.of(context).primaryColor,
              size: 32,
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            'Are you sure you want to logout ?',
            style: AppTextStyle.withColor(
              AppTextStyle.bodyTextMedium,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
           const SizedBox(height: 24,),
           Row(
           children: [
            Expanded(
            child: OutlinedButton(onPressed: ()=> Get.back(),
            style:OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: BorderSide(
                color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )
            ),
             child: Text(
              'Cancel',
              style: AppTextStyle.withColor(AppTextStyle.bodyTextMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
              ),
             ),
             ),
            ),
            const SizedBox(width: 16,),
            Expanded(
            child: ElevatedButton(
              onPressed: (){
              final AuthController authController = Get.find<AuthController>();
              authController.setloggedout();
              Get.offAll(()=>SignInScreen());
            },
            style:ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )
            ),
             child: Text(
              'Logout',
              style: AppTextStyle.withColor(AppTextStyle.bodyTextMedium,
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
    );
  }
}