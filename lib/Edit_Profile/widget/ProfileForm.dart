import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/Screens/Widgets/Custom_TextField.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness==Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
           decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: isDark ?
               Colors.black.withOpacity(0.2):
               Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
           ),
           child: CustomTextfield(
            label: 'Full Name', 
            prefixIcon: Icons.person,
            initialValue: "Insa Malik",
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: isDark ?
               Colors.black.withOpacity(0.2):
               Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            ),
            child: CustomTextfield(
            label: 'Email ', 
            prefixIcon: Icons.email_outlined,
            initialValue: "Insamalik@gmail.com",
            keyboardType: TextInputType.emailAddress,
            ), 
          ),
             const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: isDark ?
               Colors.black.withOpacity(0.2):
               Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            ),
            child: CustomTextfield(
            label: 'Phone Number ', 
            prefixIcon: Icons.phone_outlined,
            initialValue: "03XXXXXXXXX",
            keyboardType: TextInputType.phone,
            ), 
          ),
          const SizedBox(height: 32),
          SizedBox(
          width: double.infinity,
         child: ElevatedButton(
          onPressed: (){
            Get.back();
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

          ),
          child: Text(
            "Save Changes",
             style: AppTextStyle.withColor(
            AppTextStyle.bodyTextMedium,
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