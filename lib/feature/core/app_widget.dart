
import 'dart:async';
import 'package:chatgpt/feature/core/theme/color/color_manger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../../fcm/notifications_feature.dart';
import '../../utils/localization/localization_service.dart';
import '../../utils/shared/shared_pref.dart';
import '../../utils/theme/theme_service.dart';
import '../../utils/util/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../view/screens/control/control.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.changeStatusBar(
      statusBarColor: ColorManger.instance.transColor,
      systemNavigationBarColor: ColorManger.instance.primaryColor,
    );
    Timer.periodic(const Duration(days: 8) , (Timer t ) => NotificationFeature.getInstance.sendMessageToToken(title: "ChatGPT AI", body: 'Hello ${FirebaseAuth.instance.currentUser?.displayName ?? ''}, I\'m ChatGPT How I Can Help You!' ));
    return ScreenUtilInit(
      builder: (context , child) => GetMaterialApp(
        enableLog: true,
        title: "ChatGPT",
        debugShowCheckedModeBanner: false,
        locale: Locale(SharedPref.instance.getUserLanguage()),
        fallbackLocale: LocalizationService.fallbackLocale,
        themeMode: ThemeService().getThemeMode(),
        darkTheme: ThemeService().darkTheme,
        home: const ControlView(),
        translations: LocalizationService(),
        theme: ThemeService().ligthTheme,
        smartManagement: SmartManagement.onlyBuilder,
      ),
      designSize: const Size(411.42857142857144, 820.5714285714286),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}
