import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/shared/shared_pref.dart';
import '../../../core/theme/color/color_manger.dart';
import '../../../view_model/onbording_view_model/onborging_view_model.dart';
import '../auth/logIn/login_screen.dart';
import 'onbording_one.dart';
import 'onbording_three.dart';
import 'onbording_two.dart';

// ignore: must_be_immutable
class OnBordingScreen extends StatelessWidget {
  OnBordingScreen({Key? key}) : super(key: key);

  static final OnbordingViewModel onbordingViewModel =
      Get.put(OnbordingViewModel(), permanent: true);

  static const _kDuration = Duration(milliseconds: 1500);
  static const _kCurve = Curves.ease;

  final PageController pageController = PageController();
  var currentIndex = 0;

  final List<Widget> _list = <Widget>[
    const OnBordingOneScreen(),
    const OnBordingTwoScreen(),
    const OnBordingThreeScreen(),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   pageController = PageController(initialPage: 0);
  //   Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
  //     if(currentIndex < 2){
  //       currentIndex++;
  //       pageController.nextPage(
  //           duration: const Duration(milliseconds: 1500), curve: Curves.ease);
  //     }else{
  //       currentIndex = 2;
  //     }

  //   });
  // }

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnbordingViewModel>(
        init: OnbordingViewModel(),
        builder: (logic) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: ColorManger.instance.whiteColor,
            child: Column(
              children: [
                SizedBox(
                  height: 520.h,
                  width: double.infinity,
                  child: PageView.builder(
                    itemCount: _list.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    // ignore: avoid_types_as_parameter_names
                    onPageChanged: (num) {
                      logic.state = num;
                      logic.changeState(num);
                      currentIndex = logic.state;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return _list[index];
                    },
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 8.h,
                          width: logic.state == 0 ? 28.w : 8.w,
                          decoration: BoxDecoration(
                            color: logic.state == 0
                                ? logic.colorSelect1Page
                                : logic.colorUnSelect,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 8.h,
                          width: logic.state == 1 ? 28.w : 8.w,
                          decoration: BoxDecoration(
                            color: logic.state == 1
                                ? logic.colorSelect2Page
                                : logic.colorUnSelect,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 8.h,
                          width: logic.state == 2 ? 28.w : 8.w,
                          decoration: BoxDecoration(
                            color: logic.state == 2
                                ? logic.colorSelect3Page
                                : logic.colorUnSelect,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GetBuilder<OnbordingViewModel>(
                      init: OnbordingViewModel(),
                      builder: (logic) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  SharedPref.instance.setUserOnbording(newValue: true);
                                  Get.offAll(() => LogInScreen());
                                },
                                child: Text(
                                  'Skip',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: ColorManger.instance.blackColor,
                                        fontSize: 16.sp,
                                      ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  logic.state == 2
                                      ? logic.state = 0
                                      : logic.state = logic.state + 1;
                                  pageController.animateToPage(logic.state,
                                      curve: OnBordingScreen._kCurve,
                                      duration: OnBordingScreen._kDuration);
                                },
                                child: Text(
                                  'Next',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: ColorManger.instance.blackColor,
                                        fontSize: 16.sp,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
