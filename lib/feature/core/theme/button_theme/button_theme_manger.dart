import 'package:flutter/material.dart';

import '../color/color_manger.dart';
import '../text_theme/text_font_sizes.dart';

class ButtonThemeManger {
  ButtonThemeManger._();
  static ButtonThemeManger instance = ButtonThemeManger._();
  
  ButtonStyle get primaryButtonStyle => ButtonStyle(
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
      backgroundColor:
          MaterialStateProperty.all(ColorManger.instance.primaryColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textStyle: MaterialStateProperty.all(TextStyle(
          color: ColorManger.instance.blackColor,
          fontSize: TextFontSizes.instance.fontSize20)));

  ButtonStyle get seconderyButtonStyle => ButtonStyle(
      side: MaterialStateProperty.all(
        BorderSide(
          color: ColorManger.instance.primaryColor
        )
      ),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
      backgroundColor:
          MaterialStateProperty.all(ColorManger.instance.primaryColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      textStyle: MaterialStateProperty.all(TextStyle(
          color: ColorManger.instance.blackColor,
          fontSize: TextFontSizes.instance.fontSize20)));

  ButtonStyle get textWhiteButton => ButtonStyle(
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
      backgroundColor:
          MaterialStateProperty.all(ColorManger.instance.backgroundColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textStyle: MaterialStateProperty.all(TextStyle(
          color: ColorManger.instance.blackColor,
          fontSize: TextFontSizes.instance.fontSize20)));



  ButtonStyle get unselectedButtonStyle => ButtonStyle(
      side: MaterialStateProperty.all(
        BorderSide(
          color: ColorManger.instance.transColor
        )
      ),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
      backgroundColor:
          MaterialStateProperty.all(ColorManger.instance.unSelectedButton),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), 
      ),
      textStyle: MaterialStateProperty.all(TextStyle(
          color: ColorManger.instance.blackColor,
          fontSize: TextFontSizes.instance.fontSize20)));

}
