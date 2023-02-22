import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color/color_manger.dart';
import '../input_theme/app_text_field_theme.dart';
import '../text_theme/app_text_theme.dart';
import '../text_theme/text_manger.dart';

class AppTheme {
  static AppTheme instance = AppTheme._();
  AppTheme._();

  ThemeData get materialLightTheme {
    return ThemeData(
      primaryColor: ColorManger.instance.primaryColor,
      fontFamily: 'NunitoSans',
      secondaryHeaderColor: ColorManger.instance.seconderyColor,
      scaffoldBackgroundColor: ColorManger.instance.seconderyColor,
      textTheme: AppTextTheme.instance.textAppTheme,
      highlightColor: ColorManger.instance.transColor,
      splashColor: ColorManger.instance.transColor,
      // ignore: deprecated_member_use
      errorColor: ColorManger.instance.errorColor,
      inputDecorationTheme: AppTextFieldTheme.instance.inputDecorationTheme,
      tabBarTheme: const TabBarTheme(),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManger.instance.primaryColor,
        selectionColor: ColorManger.instance.primaryColor,
        selectionHandleColor: ColorManger.instance.primaryColor,
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: ColorManger.instance.primaryColor,
        selectedBorderColor: ColorManger.instance.primaryColor,
        borderColor: ColorManger.instance.primaryColor,
        fillColor: ColorManger.instance.primaryColor,
        splashColor: ColorManger.instance.primaryColor.withOpacity(0.12),
        hoverColor: ColorManger.instance.primaryColor.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8.0),
        constraints: const BoxConstraints(minHeight: 36.0),
      ),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextManger.instance.textStyleWhiteColorh4,
          backgroundColor: ColorManger.instance.appBarColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManger.instance.transColor,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: ColorManger.instance.primaryColor,
          )),
    );
  }
}
