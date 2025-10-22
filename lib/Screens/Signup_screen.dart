import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingapp/Screens/Widgets/Custom_TextField.dart';
import 'package:shoppingapp/Screens/main_screen.dart';
import 'package:shoppingapp/Screens/signIn_screen.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';


class SignupScreen extends StatefulWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark= Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Get.off(()=>SignInScreen());
          },
        )
      ),
      body: SafeArea(
        child:SingleChildScrollView(
         padding: EdgeInsets.all(24),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IconButton(onPressed:(){
            //   Get.back();
            // } ,//()=>Get.off(()=>SignInScreen()), 
            // icon: Icon(Icons.arrow_back_ios,
            // color: isDark ? Colors.white : Colors.black,
            // )),
            const SizedBox(height: 20,),
            Text("Create Account",
            style: AppTextStyle.withColor(
            AppTextStyle.h1,Theme.of(context).textTheme.bodyLarge!.color!
            ),),
            const SizedBox(height: 8,),
            Text("Create your account to continue",
            style: AppTextStyle.withColor(
            AppTextStyle.bodyTextLarge,
            isDark ? Colors.grey[400]!:Colors.grey[600]!),),

            const SizedBox(height: 40,),
            CustomTextfield(label: "Full Name",
             prefixIcon: Icons.person_2_outlined,
             keyboardType: TextInputType.name,
             controller: widget._nameController,
             validator: (value) {
              if(value == null || value.isEmpty){
               return 'Please Enter Your Name';
              }
               return null;
             },
            ),
            const SizedBox(height: 16,),
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
            const SizedBox(height: 16,),
            CustomTextfield(label: "Password",
             prefixIcon: Icons.lock_outlined,
             isPassword: true,
             controller: widget._passwordController,
             validator: (value) {
              if(value == null || value.isEmpty){
               return 'Please Enter Your Password';
              }
               return null;
             },
            ),
            const SizedBox(height: 16,),
            CustomTextfield(label: "Confirm Password",
             prefixIcon: Icons.lock_outlined,
             isPassword: true,
             controller: widget._confirmController,
             validator: (value) {
              if(value == null || value.isEmpty){
               return 'Please confirm Your Password';
              }if(value !=widget._passwordController.text){
                return 'Password does not match';
              }
               return null;
             },
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(12),
                  )
                ),
                onPressed: ()=>Get.off(()=>MainScreen()),
                child:Text(
                  "Sign Up",
                  style: AppTextStyle.withColor(
                    AppTextStyle.MediumButton,
                    Colors.white),
                )),
              ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You have an already account?',
                style:AppTextStyle.withColor(AppTextStyle.bodyTextLarge,
                isDark?Colors.grey[400]!:Colors.grey[600]!),
                ),
                TextButton(onPressed: ()=>Get.off(()=>SignInScreen()),
                 child: Text('Sign In',
                style:AppTextStyle.withColor(
                 AppTextStyle.MediumButton,
                 Theme.of(context).primaryColor),
                 )),
              ],
            ),
          ],
         ),
        ),
      ),
    );
  }
}