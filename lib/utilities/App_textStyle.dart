import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{
  static TextStyle h1= GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height:1.2 ,
    letterSpacing: -0.5,
  );
  static TextStyle h2= GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );
  static TextStyle h3= GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
   
  );

  static TextStyle bodyTextLarge= GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
   
  );
  static TextStyle bodyTextMedium= GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
   
  );
  static TextStyle bodyTextSmall= GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
   
  );

  static TextStyle LargeButton= GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
  static TextStyle MediumButton= GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static TextStyle SmallButton= GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

   static TextStyle MediumLable= GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle withColor(TextStyle style,Color color, ){
    return style.copyWith(color: color);

  }


  static TextStyle withWight(TextStyle style,FontWeight Weight){
    return style.copyWith(fontWeight: Weight);
  }
}