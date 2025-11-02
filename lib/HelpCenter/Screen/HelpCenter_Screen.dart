import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/HelpCenter/Widget/Contact_Support_Section.dart';
import 'package:shoppingapp/HelpCenter/Widget/HelpCategory.dart';
import 'package:shoppingapp/HelpCenter/Widget/popularQuestion.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class HelpcenterScreen extends StatelessWidget {
  const HelpcenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final isDark =Theme.of(context).brightness ==Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       appBar: AppBar(
        leading: IconButton(
        onPressed: ()=> Get.back(),
         icon: Icon(Icons.arrow_back_ios),
         ),
        title: Text(
          "Help Center",
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
           isDark?  Colors.white: Colors.black,
          ),
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(context,isDark),
            const SizedBox(height: 24),
            PopularQuestionsSection(),
            const SizedBox(height: 24),
            HelpCategoriesSection(),
            const SizedBox(height: 24),
            ContactSupportSectio(),
          ],
        ),
      ),
    );
  }
  Widget _buildSearchBar(BuildContext context,bool isDark){
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ?
           Colors.black.withOpacity(0.2) 
           : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for help",
          hintStyle: AppTextStyle.withColor(
            AppTextStyle.bodyTextMedium,
           isDark?  Colors.grey[400]!: Colors.grey[600]!,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: isDark ? Colors.grey[400] :Colors.grey[600],
            ),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Theme.of(context).cardColor,
        ),
        ),
    );
  }
}