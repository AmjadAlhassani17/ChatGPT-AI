import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerEmptyChatScreen extends StatelessWidget {
  const ContainerEmptyChatScreen({super.key , required this.text , required this.onTap});

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 45.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Theme.of(context).cardColor, 
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  text,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
