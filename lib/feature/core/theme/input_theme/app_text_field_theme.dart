import 'package:flutter/material.dart';
import '../color/color_manger.dart';
import '../text_theme/text_manger.dart';

class AppTextFieldTheme {
  static AppTextFieldTheme instance = AppTextFieldTheme._();
  AppTextFieldTheme._();

  InputDecorationTheme get inputDecorationTheme {
    return InputDecorationTheme(
        filled: true,
        fillColor: ColorManger.instance.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: TextManger.instance.textStyleh5,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorManger.instance.transColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorManger.instance.transColor)),
        focusColor: ColorManger.instance.blackColor,
        suffixStyle: TextManger.instance.textStyleh6,
        suffixIconColor: ColorManger.instance.transColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20));
  }

  BoxDecoration get bottomSheetDecoration {
    return BoxDecoration(
        color: ColorManger.instance.backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)));
  }

  InputDecoration get inputSearchDecoration {
    return InputDecoration(
        filled: true,
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: ColorManger.instance.transColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: ColorManger.instance.transColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: ColorManger.instance.transColor,
          ),
        ),
        fillColor: ColorManger.instance.backgroundColor);
  }


  BoxDecoration get selectedTabDecoration => BoxDecoration(
        color: ColorManger.instance.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      );

        BoxDecoration get unSelectedTabDecoration => BoxDecoration(
        color: ColorManger.instance.backgroundColor,
        border: Border.all(
          color: ColorManger.instance.primaryColor,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      );
}
