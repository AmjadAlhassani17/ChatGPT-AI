import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.lable,
      required this.fontSize,
      this.color,
      this.fontWeight});

  final String lable;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize:  fontSize,
          ),
    );
  }
}
