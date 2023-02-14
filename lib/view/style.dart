import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  Style._();

  // ---------- Color   ---------- //

  static const oneColor = Color(0xffffde9b);
  static const twoColor = Color(0xffd0e3fa);
  static const primaryColor=Colors.orange;
  static const disPrimaryColor=Colors.orangeAccent;
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const greyColor = Color(0xffEBEEF2);
  static const darkGreyColor=Colors.grey;
  static const darkBgcolorOfApp = Color(0xff0D0D0D);

  // ---------- Gradient   ---------- //

  static const linearGradient = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Style.disPrimaryColor,
        Style.disPrimaryColor,
        Style.primaryColor,
      ]);




  static textStyleRegular(
      {double size = 18,
        Color textColor = blackColor,

      }) =>
      GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.w600,
          color: textColor,


          fontSize: size
      );


  static textStyleRegular2(
      {double size = 16,
        Color textColor = blackColor,

      }) =>
      GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: size
      );

  static textStyleAuth(
      {double size = 16,
        Color textColor = blackColor,
      }) => TextStyle(
      fontWeight: FontWeight.w600,
      color: textColor,
      fontSize: size
  );

  static textStyleNorm(
      {double size = 16,
        Color textColor = blackColor,
      }) => TextStyle(
      fontWeight: FontWeight.w400,
      color: textColor,
      fontSize: size
  );
}