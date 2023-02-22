import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constance/constance.dart';
import '../../core/theme/color/color_manger.dart';

class OnbordingViewModel extends GetxController{
  int state = Constance.pageSelect;
  Color colorSelect1Page = ColorManger.instance.colorSelect1Page;
  Color colorSelect2Page = ColorManger.instance.colorSelect2Page;
  Color colorSelect3Page = ColorManger.instance.colorSelect3Page;
  Color colorUnSelect = ColorManger.instance.primaryColor;
  Color? color;

  int passwordLenght = 0;

  void changePasswordLenght({required int lenght}) {
    passwordLenght = lenght;
    update();
  }

  void changeState(int select) {
    state = select;
    update();
  }
}