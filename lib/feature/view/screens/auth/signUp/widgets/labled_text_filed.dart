// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/color/color_manger.dart';

class LabeldTextFieldSignUp extends StatelessWidget {
  LabeldTextFieldSignUp(
      {Key? key,
      this.isNumbers = false,
      this.isPassword = false,
      this.isEmail = false,
      this.numberOfLines = 1,
      this.isReadOnly = false,
      this.validator,
      this.controller})
      : super(key: key);

  final bool isNumbers;
  final bool isEmail;
  final bool isPassword;
  final int numberOfLines;
  final TextEditingController? controller;
  final bool isReadOnly;
  Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ?? TextEditingController(),
      maxLines: numberOfLines,
      readOnly: isReadOnly,
      minLines: numberOfLines,
      obscureText: isPassword,
      cursorColor: ColorManger.instance.primaryColor,
      
      validator: (e) {
        if (validator != null) {
          return validator!(e.toString());
        }
        return null;
      },
      keyboardType: isNumbers
          ? TextInputType.phone
          : isEmail
              ? TextInputType.emailAddress
              : isPassword
                  ? TextInputType.visiblePassword
                  : TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 0.h,
          horizontal: 20.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.instance.primaryColor),
          borderRadius: BorderRadius.circular(12.r)
        ),
        // Focused Border
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.instance.primaryColor),
          borderRadius: BorderRadius.circular(12.r)
        ),
        // Error Border
        errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.instance.primaryColor),
          borderRadius: BorderRadius.circular(12.r)
        ),
        // Focused Error Border
        focusedErrorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.instance.primaryColor),
          borderRadius: BorderRadius.circular(12.r)
        ),
        // hintStyle: TextStyle(color: ColorManger.instance.textFieldColor),
        filled: true,
        fillColor: ColorManger.instance.transColor,
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.r),
        //   borderSide:
        // BorderSide(
        // color: ColorManger.instance.textFiledBackgroundColor,),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.r),
        //   borderSide:
        // BorderSide(
        // color: ColorManger.instance.textFiledBackgroundColor,),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.r),
        //   borderSide:
        // BorderSide(
        // color: ColorManger.instance.textFiledBackgroundColor,),
        // ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.r),
        //   borderSide:
        // BorderSide(
        // color: ColorManger.instance.textFiledBackgroundColor,),
        // ),
      ),
    );
  }
}
