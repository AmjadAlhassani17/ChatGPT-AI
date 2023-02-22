
import 'package:chatgpt/feature/view/widget/three_size_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/button_theme/button_theme_manger.dart';
import '../../core/theme/color/color_manger.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.height,
    this.width,
    this.backroundColor,
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? backroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        style: backroundColor == null
            ? ButtonThemeManger.instance.primaryButtonStyle
            : ButtonThemeManger.instance.primaryButtonStyle.copyWith(
                backgroundColor: MaterialStateProperty.all(backroundColor)),
        onPressed: () {
          onPressed();
        },
        child: isLoading
            ? ThreeSizeDot(
                color_1: ColorManger.instance.backgroundColor,
                color_2: ColorManger.instance.backgroundColor,
                color_3: ColorManger.instance.backgroundColor,
              )
            : Text(
                text,
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManger.instance.backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    ),
              ),
      ),
    );
  }
}
