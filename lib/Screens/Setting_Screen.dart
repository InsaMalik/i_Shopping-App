import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/Controllers/Theme_controller.dart';
import 'package:shoppingapp/Screens/account_Screen.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(Icons.arrow_back,
          color: isDark ? Colors.white: Colors.black,
          ),
        ),
        title: Text(
          'Settings',
           style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              'Apperance',
              [
                _buildThemeToggle(context),
              ],
            ),
            _buildSection(context,
             "Notification",
              [
                _builtSwitchTile(
                  context,
                  "Push Notifications",
                  "Receive push notifications about orders and promotions",
                  true,
                ),
                _builtSwitchTile(
                  context,
                  "Email Notifications",
                  "Receive Email  updates about your orders",
                  false,
                ),
              ]
              ),
              _buildSection(context,
               'Privacy ',
                [
                  _buildNotificationTile(
                    context,
                    "Privacy Policy",
                    "View our privacy policy",
                    Icons.privacy_tip_outlined,
                    ),
                     _buildNotificationTile(
                    context,
                    "Terms of Services",
                    "Reads our terms of services",
                    Icons.description_outlined,
                    ),
                ]
                ),
                _buildSection(context,
                 'About',
                 [
                  _buildNotificationTile(
                  context,
                   'App Version',
                    '1.0.0',
                    Icons.info_outline,
                    ),
                 ]
                 ),
          ],
        ),
      ),
    );
  }
  Widget _buildSection(BuildContext context, String title, List<Widget> children){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.fromLTRB(24, 24, 24, 8),
          child: Text(
            title,
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              isDark ? Colors.grey[400]!: Colors.grey[600]!,
            ),
          ),
        ),
        ...children,
      ],
    );
  }
  Widget _buildThemeToggle(BuildContext context){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<ThemeController>(
      builder: (controller)=>Container(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          color : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            'Dark Mode',
            style: AppTextStyle.withColor(
              AppTextStyle.bodyTextMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          trailing: Switch.adaptive(value: controller.isDarkMode,
           onChanged: (value)=>controller.toggleTheme(),
           activeColor: Theme.of(context).primaryColor,
           ),
        ),
      ),
    );
  }

  Widget _builtSwitchTile(
    BuildContext context,
    String title,
    String subtitle,
    bool initialValue,
  ){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    decoration: BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
    ),
    child: ListTile(
      title: Text(
        title,
        style: AppTextStyle.withColor(
          AppTextStyle.bodyTextMedium,
          Theme.of(context).textTheme.bodyLarge!.color!,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyle.withColor(
          AppTextStyle.bodyTextSmall,
          isDark ? Colors.grey[400]! :Colors.grey[600]!,
        ),
      ),
      trailing: Switch.adaptive(
        value: initialValue, 
        onChanged: (value){},
        activeColor: Theme.of(context).primaryColor,
        ),
    ),
    );
  }

  Widget _buildNotificationTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          color : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            title,
            style: AppTextStyle.withColor(
              AppTextStyle.bodyTextMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextStyle.withColor(
              AppTextStyle.bodyTextSmall,
              isDark ? Colors.grey[400]! :Colors.grey[600]!,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: isDark ? Colors.grey[400]! :Colors.grey[600]!,
          ),
          onTap: (){},
        ),
    );
  }
}