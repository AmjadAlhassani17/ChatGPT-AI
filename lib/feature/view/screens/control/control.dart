import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/shared/shared_pref.dart';
import '../../../view_model/auth_view_model/auth_view_model.dart';
import '../auth/logIn/login_screen.dart';
import '../home/chat_home_screen.dart';
import '../onbording/onbording.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  static AuthViewModel authViewModel =
      Get.put(AuthViewModel(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (authViewModel.user == null)
            ? SharedPref.instance.getUserOnbording()
                ? LogInScreen()
                : OnBordingScreen()
            : const ChatHomeScreen();
      },
    );
  }
}
// https://docs.google.com/document/d/16H8LZtzzmgAEs59xx-WYximkJlOU-bWlwvTRwGt7BFY/edit?usp=sharing