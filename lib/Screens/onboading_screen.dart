import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingapp/Controllers/Auth_controller.dart';
import 'package:shoppingapp/Screens/signIn_screen.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});

  @override
  State<OnboadingScreen> createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {
  final PageController _pageController= PageController();
  int _currentPage = 0;
  final List<onboadingItems> _onboadingItems=[
    onboadingItems(
     image: 'images/intro.png',
     title: 'Descover latest Treands',
     description: 'Explore the best newest fashion and find your unique style'
     ),

     onboadingItems(
     image: 'images/intro1.png',
     title: 'Quality Products',
     description: 'Shop premium quality products from the best brands worldwide'
     ),

     onboadingItems(
     image: 'images/intro2.png',
     title: 'Easy Shopping',
     description: 'Simple and Secure Shopping Experience at your fingertips'
     ),
  ];

  void _handleGetStarted(){
   final AuthController authController = Get.find<AuthController>();
   authController.setFirstTime();
   Get.off(()=>  SignInScreen());
  }
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness== Brightness.dark;
    return Scaffold(
     body: SafeArea(
       child: Stack(
        children: [
          PageView.builder(
           controller : _pageController,
           itemCount: _onboadingItems.length,
           onPageChanged: (index){
             setState(() {
               _currentPage=index;
             });
           },
          
          itemBuilder: (context,index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Image.asset(
                _onboadingItems[index].image,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              const SizedBox(height: 40,),
              Text(
                _onboadingItems[index].title,
                textAlign: TextAlign.center,
                style: AppTextStyle.withColor(AppTextStyle.h1,Theme.of(context).textTheme.bodyLarge!.color!),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 32),
                child: Text(
                  _onboadingItems[index].description,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyTextLarge,
                    isDark?Colors.grey[400]!:Colors.grey[600]!,),
                ),
                ),
       
             ],
            );
          }),
         Positioned(
          bottom: 80,
          left:0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboadingItems.length,
              (index) => AnimatedContainer(
                duration: Duration(microseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width:_currentPage == index ? 24 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Theme.of(context).primaryColor:
                    (isDark ?Colors.grey[700] : Colors.grey[300]),
                  borderRadius: BorderRadius.circular(4),
                ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left:16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () =>_handleGetStarted(),
                  child: Text(
                    'Skip',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyTextMedium,
                      isDark?Colors.grey[400]!:Colors.grey[600]!,),
                  )
                ),
                ElevatedButton(
                  onPressed: () {
                    if(_currentPage<_onboadingItems.length-1){
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }else{
                      _handleGetStarted();
                  }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical:16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                   _currentPage<_onboadingItems.length-1?'Next':'Get Started',
                    style: AppTextStyle.withColor(
                     AppTextStyle.bodyTextMedium,
                     Colors.white,
                   ),
                  ),
                ),
              ],
            ),
            ),
       
       
        ],
       ),
     ),
    );
  }
}


class onboadingItems{
  final String image;
  final String title;
  final String description;


  onboadingItems({
    required this. image,
    required this .title,
   required this .description,
  });
}