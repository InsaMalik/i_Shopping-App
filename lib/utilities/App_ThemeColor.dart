import 'package:flutter/material.dart';

class AppThemecolor{
  static final light= ThemeData(
    primaryColor:const Color(0xFF33691E),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,  
      ),  
    ),
    colorScheme : ColorScheme.fromSeed(
          seedColor: Color(0xFF33691E),
          primary: Color(0xFF33691E),
          brightness: Brightness.light,
          surface: Colors.white,
     ),
     cardColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
       backgroundColor: Colors.white,
       selectedItemColor: Color(0xFF33691E),
       unselectedItemColor: Colors.grey,
     ),
  );

   static final Dark= ThemeData(
    primaryColor:const Color(0xFF33691E),
    scaffoldBackgroundColor: const Color(0xFF121212),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,  
      ),  
    ),
    colorScheme : ColorScheme.fromSeed(
          seedColor: Color(0xFF33691E),
          primary: Color(0xFF33691E),
          brightness: Brightness.dark,
          surface: Color(0xFF121212),
     ),
     cardColor: Color(0xFF1E1E1E),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
       backgroundColor:Color(0xFF1E1E1E),
       selectedItemColor: Color(0xFF33691E),
       unselectedItemColor: Colors.grey,
     ),
  );

}
