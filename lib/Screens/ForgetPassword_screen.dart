import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingapp/Screens/Widgets/Custom_TextField.dart';
import 'package:shoppingapp/Screens/signIn_screen.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class ForgetpasswordScreen extends StatefulWidget {
  final TextEditingController _emailController = TextEditingController();
   ForgetpasswordScreen({super.key});

  @override
  State<ForgetpasswordScreen> createState() => _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends State<ForgetpasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              IconButton(onPressed:(){
              
                Get.off(()=>SignInScreen());
              },
              icon: Icon(Icons.arrow_back_ios,
              color: isDark ? Colors.white : Colors.black,
              ),
              ),
              const SizedBox(height: 20,),
              Text("Forget Password",
              style: AppTextStyle.withColor(
              AppTextStyle.h1,
              Theme.of(context).textTheme.bodyLarge!.color!),),
              const SizedBox(height: 8,),
              Text('Enter your email address and we will send you a link to reset your password. ',
              style: AppTextStyle.withColor(
                AppTextStyle.bodyTextLarge,
                isDark? Colors.grey[400] !: Colors.grey[600]!,
              ),),
              const SizedBox(height: 40,),
              CustomTextfield(label: "Email",
               prefixIcon: Icons.email_outlined,
               keyboardType: TextInputType.emailAddress,
               controller: widget._emailController,
               validator: (value) {
                if(value == null || value.isEmpty){
                 return 'Please Enter Your Email';
                }
                if(!GetUtils.isEmail(value)){
                  return 'Please Enter Valid Email';
                }
                 return null;
               },
              ),
              const SizedBox(height: 40,),
            SizedBox(width: double.infinity,
              child: ElevatedButton(onPressed: (){
               showSuccessdialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: EdgeInsetsDirectional.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),)
              ),
              child: Text(
                "Send Reset Link ",
              style: AppTextStyle.withColor(
                 AppTextStyle.MediumButton,
                 Colors.white,
                ),
              ),),
              ),
             ],
          ),
        ),
      )
      ),
    );
  }
  void showSuccessdialog(BuildContext context){
   Get.dialog(
    AlertDialog(
      title: Text("Password Reset Link Sent",
      style: AppTextStyle.withColor(AppTextStyle.h1,
      Theme.of(context).textTheme.bodyLarge!.color!),
      ),
      content: Text("We have sent a password reset link to your email address. Please check your inbox.",
      style: AppTextStyle.bodyTextMedium
      ),
      actions: [
        TextButton(onPressed: Get.back,
        child: Text("OK",
        style: AppTextStyle.withColor(
        AppTextStyle.MediumButton, Theme.of(context).primaryColor),
        ),)
      ],
    )
   );
  }
}