import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:shoppingapp/Controllers/Auth_controller.dart';
import 'package:shoppingapp/Screens/ForgetPassword_screen.dart';
import 'package:shoppingapp/Screens/Signup_screen.dart';
import 'package:shoppingapp/Screens/Widgets/Custom_TextField.dart';
import 'package:shoppingapp/Screens/main_screen.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class SignInScreen extends StatefulWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {

    final isDark=Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Text("Welcome!",
              style: AppTextStyle.withColor(
              AppTextStyle.h1,Theme.of(context).textTheme.bodyLarge!.color!),
              ),
              const SizedBox(height: 8 ,),
              Text("Sign_In to Continue Shopping...",
              style: AppTextStyle.withColor(
              AppTextStyle.bodyTextLarge,
              isDark?Colors.grey[400]!:Colors.grey[600]!,
              ),
            ),
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
            SizedBox(height: 16,),
            CustomTextfield(label: "Password",
             prefixIcon: Icons.lock_outlined,
             keyboardType: TextInputType.visiblePassword,
             isPassword: true,
             controller: widget._passwordController,
             validator: (value) {
              if(value == null || value.isEmpty){
               return 'Please Enter Your password';
              }
               return null;
             },
            ),
            SizedBox(height: 8,),
            Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: ()=>Get.off(()=>ForgetpasswordScreen()),
              child: Text('Forget Password?',
              style: AppTextStyle.withColor(
               AppTextStyle.MediumButton,
               Theme.of(context).primaryColor,
              ),
              ),
              ),
            ),
            SizedBox(height: 24,),
            SizedBox(width: double.infinity,
            child: ElevatedButton(onPressed: (){
              _handleSignIn();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsetsDirectional.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),)
            ),
            child: Text(
              "Sign In",
            style: AppTextStyle.withColor(
               AppTextStyle.MediumButton,
               Colors.white,
              ),
            ),),
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                style: AppTextStyle.withColor(AppTextStyle.MediumButton,
                 isDark? Colors.grey[400] !: Colors.grey[600]!),
                ),
                TextButton(onPressed: ()=>Get.off(()=>SignupScreen()),
                child: Text("Sign Up",
                style: AppTextStyle.withColor(
                AppTextStyle.MediumButton,
                Theme.of(context).primaryColor,),
                ),
                ),
              ],
            ),
            
            ],
          ),
        ) 
      ),
    );
  }

  void _handleSignIn(){
    final AuthController authController = Get.find<AuthController>();
    authController.setloggedIn();
    Get.off(()=>MainScreen());
    
  }
}