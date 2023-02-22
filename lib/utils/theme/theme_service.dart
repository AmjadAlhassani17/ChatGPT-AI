import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../feature/core/theme/color/color_manger.dart';
import '../../feature/core/theme/text_theme/text_manger.dart';
import '../shared/shared_pref.dart';

class ThemeService {
  //Ligth Theme
  final ligthTheme = ThemeData.light().copyWith(
    primaryColor: ColorManger.instance.primaryColor,
    scaffoldBackgroundColor: ColorManger.instance.whiteColor,
    dividerColor: ColorManger.instance.whiteColor,
    hoverColor: ColorManger.instance.greyColor.withOpacity(0.1),
    cardColor: ColorManger.instance.greyColor.withOpacity(0.1),
    hintColor: ColorManger.instance.blackColor,
    focusColor: ColorManger.instance.whiteColor,
    indicatorColor: ColorManger.instance.primaryColor,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManger.instance.primaryColor,
        selectionColor: ColorManger.instance.primaryColor,
        selectionHandleColor: ColorManger.instance.primaryColor,
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
      ),
    ),
    colorScheme: const ColorScheme.light(primary: Colors.blue),
    iconTheme: IconThemeData(color: ColorManger.instance.iconLigthColor),
  );

  //Dark Theme
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: ColorManger.instance.primaryColor,
    scaffoldBackgroundColor: ColorManger.instance.seconderyColor,
    dividerColor: ColorManger.instance.seconderyColor,
    cardColor: ColorManger.instance.containerChatScreenColor,
    hoverColor: ColorManger.instance.textFiledColor,
    hintColor: ColorManger.instance.whiteColor,
    focusColor: ColorManger.instance.whiteColor,
    indicatorColor: ColorManger.instance.whiteColor,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManger.instance.primaryColor,
        selectionColor: ColorManger.instance.primaryColor,
        selectionHandleColor: ColorManger.instance.primaryColor,
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
      ),
    ),
    colorScheme: const ColorScheme.dark(primary: Colors.blue),
    iconTheme: IconThemeData(color: ColorManger.instance.iconDarkColor),
  );
  //Get ThemeMode
  ThemeMode getThemeMode() {
    return SharedPref.instance.getThemeApp() ? ThemeMode.dark : ThemeMode.light;
  }

  //Change ThemeMode
  void changeTheme() {
    Get.changeThemeMode(
        SharedPref.instance.getThemeApp() ? ThemeMode.light : ThemeMode.dark);
    SharedPref.instance
        .setThemeApp(newTheme: !SharedPref.instance.getThemeApp());
  }
}
