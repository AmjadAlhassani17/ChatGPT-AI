import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/assets_manger.dart';
import '../../../core/theme/color/color_manger.dart';

class OnBordingTwoScreen extends StatelessWidget {
  const OnBordingTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.h,
      width: double.infinity,
      color: ColorManger.instance.transColor,
      child: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          SizedBox(
            height: 350.h,
            width: 350.w,
            child: Image.asset(ImagesManger.onboarding2),
          ),
          Text(
            "DATASETS",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorManger.instance.blackColor,
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.h),
            child: Text(
              "Lorem ipsum dolor sit amet, adipiscing elit.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: ColorManger.instance.blackColor,
                    fontSize: 16.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
