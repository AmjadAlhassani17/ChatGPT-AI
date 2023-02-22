// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/assets_manger.dart';
import '../../../../core/theme/color/color_manger.dart';
import '../../../../view_model/auth_view_model/auth_view_model.dart';
import '../../../widget/primary_button.dart';
import '../signUp/signup_screen.dart';
import 'widgets/labled_text_filed.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  static AuthViewModel logInViewModel =
      Get.put(AuthViewModel(), permanent: true);
  GlobalKey<FormState> formKeyLogIn = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: ColorManger.instance.whiteColor,
          child: GetBuilder<AuthViewModel>(
              init: AuthViewModel(),
              builder: (logic) {
                return Form(
                  key: formKeyLogIn,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 110.h,
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
                          'Welcome Back',
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
                          'Login',
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
                                    color: ColorManger.instance.primaryColor,
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
                              LabeldTextField(
                                controller: logic.tdEmailLogIn,
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
                                    color: ColorManger.instance.primaryColor,
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
                              LabeldTextField(
                                controller: logic.tdPasswordLogIn,
                                validator: (value) {
                                  if (value.toString().length < 6 ||
                                      value!.isEmpty) {
                                    return 'You must enter a password greater than or equal to 6.';
                                  } else {
                                    return null;
                                  }
                                },
                                isPassword: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: PrimaryButton(
                            isLoading: logic.isLoading,
                            onPressed: () {
                              formKeyLogIn.currentState!.save();
                              if (formKeyLogIn.currentState!.validate()) {
                                logic.signInWithEmailAndPassword();
                              }
                            },
                            text: 'Login',
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Are you a new user?',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: ColorManger.instance.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SignUpScreen());
                              },
                              child: Text(
                                ' Sign up',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: ColorManger.instance.logoColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthViewModel>(
                              init: AuthViewModel(),
                              builder: (logic) {
                                return InkWell(
                                  onTap: () {
                                    logic.googleSignInMethod();
                                  },
                                  child: SizedBox(
                                    height: 32.h,
                                    width: 32.w,
                                    child: SvgPicture.asset(SvgsManger.google),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            GetBuilder<AuthViewModel>(
                              init: AuthViewModel(),
                              builder: (logic) {
                                return InkWell(
                                  onTap: () {
                                    logic.signInWithFacebook();
                                  },
                                  child: SizedBox(
                                    height: 32.h,
                                    width: 32.w,
                                    child:
                                        SvgPicture.asset(SvgsManger.facebook),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
