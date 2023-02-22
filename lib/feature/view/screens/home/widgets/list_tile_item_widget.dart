import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({super.key , required this.title , required this.icon , required this.onTap});

  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).focusColor
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16.sp, color: Theme.of(context).focusColor),
      ),
      onTap: onTap,
    );
  }
}
