// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/assets_manger.dart';
import '../../../../core/theme/color/color_manger.dart';
import '../../../../view_model/auth_view_model/auth_view_model.dart';
import '../../../widget/primary_button.dart';
import '../logIn/login_screen.dart';
import 'widgets/labled_text_filed.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  static AuthViewModel logInViewModel =
      Get.put(AuthViewModel(), permanent: true);

  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManger.instance.whiteColor,
          elevation: 0.0,
          foregroundColor: ColorManger.instance.appBarColor,
          automaticallyImplyLeading: false,
          leading: GetBuilder<AuthViewModel>(
            init: AuthViewModel(),
            builder: (logic) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 25,
                alignment: Alignment.centerLeft,
                onPressed: () {
                  logic.restLogInController();
                  logic.restSignUpController();
                  Get.back();
                },
                color: ColorManger.instance.primaryColor,
              );
            },
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: ColorManger.instance.whiteColor,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                GetBuilder<AuthViewModel>(
                    init: AuthViewModel(),
                    builder: (logic) {
                      return Form(
                        key: formKeySignUp,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            boxShadow: [
                            BoxShadow(
                              color: ColorManger.instance.unSelectedWidget
                                  .withOpacity(0.125),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            )
                          ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: Image.asset(
                              ImagesManger.chatGptAI,
                              height: 70.h,
                              width: 70.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              'Create Account',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 20.sp,
                                    color: ColorManger.instance.blackColor,
                                  ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Sign Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManger.instance.primaryColor,
                                  ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        color:
                                            ColorManger.instance.primaryColor,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        'Full Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              fontSize: 14.sp,
                                              color: ColorManger
                                                  .instance.textFieldColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  LabeldTextFieldSignUp(
                                    controller: logic.tdNameSignUp,
                                    isEmail: true,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          GetUtils.isNull(value.toString())) {
                                        return 'Enter your name correctly.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email_outlined,
                                        color:
                                            ColorManger.instance.primaryColor,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        'Your Email',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              fontSize: 14.sp,
                                              color: ColorManger
                                                  .instance.textFieldColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  LabeldTextFieldSignUp(
                                    controller: logic.tdEmailSignUp,
                                    isEmail: true,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !GetUtils.isEmail(value.toString())) {
                                        return 'Enter your email correctly.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.lock_outline,
                                        color:
                                            ColorManger.instance.primaryColor,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        'password',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              fontSize: 14.sp,
                                              color: ColorManger
                                                  .instance.textFieldColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  LabeldTextFieldSignUp(
                                    controller: logic.tdPasswordSignUp,
                                    isPassword: true,
                                    validator: (value) {
                                      if (value.toString().length < 6 ||
                                          value!.isEmpty) {
                                        return 'You must enter a password greater than or equal to 6.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: GetBuilder<AuthViewModel>(
                      init: AuthViewModel(),
                      builder: (logic) {
                        return PrimaryButton(
                          isLoading: logic.isLoading,
                            onPressed: () {
                              formKeySignUp.currentState!.save();
                              if (formKeySignUp.currentState!.validate()) {
                                logic.creatAccountWithEmailAndPassword();
                              }
                            },
                            text: 'Sign Up');
                      }),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorManger.instance.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => LogInScreen());
                      },
                      child: Text(
                        ' Login',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorManger.instance.logoColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
