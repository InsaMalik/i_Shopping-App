import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingapp/Controllers/Auth_controller.dart';
import 'package:shoppingapp/Screens/main_screen.dart';
import 'package:shoppingapp/Screens/onboading_screen.dart';
import 'package:shoppingapp/Screens/signIn_screen.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});
  final AuthController  authController=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
  Future.delayed(const Duration(seconds: 2),(){
   if(authController.isFirstTime){
     Get.off(() => const OnboadingScreen());
   }else if(authController.isloggedIn){
     Get.off(() => const MainScreen());
   }else{
     Get.off(() =>  SignInScreen());
   }
  });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
         gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
             Theme.of(context).primaryColor.withOpacity(0.8),
             Theme.of(context).primaryColor.withOpacity(0.6),
          ]
         ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(opacity: 0.05,
              child: GridPattern(
                color: Colors.white,
               ), 
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0,end: 1.0),
                     duration: const Duration(milliseconds: 1200), //change
                     builder: (context,value,child){
                      return Transform.scale(
                        scale: value,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              spreadRadius: 2,
                              offset: const Offset(0, 4),
                            )
                            ]
                          ),
                          child: Icon(
                          Icons.shopping_bag_outlined,
                          size: 48,
                          color:Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                     },),
                     const SizedBox(height: 32,),
                      TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0,end: 1.0),
                     duration: const Duration(milliseconds: 1200), //change
                     builder: (context,value,child){
                      return  Opacity(opacity: value,
                      child: Transform.translate(offset: Offset(0, 20*(1-value)),
                      child: child,
                      ),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          "FASHION",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 8,
                        ),
                        ),
                        Text(
                          "STORE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 4,
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           Positioned(
                    bottom: 48,
                    left: 0,
                    right: 0,
                    child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0,end: 1.0),
                     duration: const Duration(milliseconds: 1200), //change
                     builder: (context,value,child){
                      return  Opacity(
                        opacity: value,
                      child: child,
                      );
                    },
                    child: Text(
                      "Style Meets Simplicity",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2,
                      ),
                    ),
                 ),
              ),
          ],
        ),
      ),
    );
  }
}


class GridPattern extends StatelessWidget {
  final Color color;
   GridPattern(
    {   Key? key,
        required this.color,}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GridPainter(color: color),
    );
  }
}

class GridPainter extends CustomPainter {
  final Color color;
  GridPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..color = color
    ..strokeWidth = 0.5;

    final spacing = 20.0;
    for( var i = 0.0; i< size.width; i += spacing){
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

     for( var i = 0.0; i< size.height; i += spacing){
      canvas.drawLine(Offset(0, i), Offset(size.width,i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;
  
  }