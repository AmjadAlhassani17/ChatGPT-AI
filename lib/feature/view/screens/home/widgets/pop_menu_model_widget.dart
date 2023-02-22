import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';

class PopupMenuModelWidget extends StatelessWidget {
  const PopupMenuModelWidget({super.key, required this.getMenuItems});
  final List<QudsPopupMenuBase> getMenuItems;

  @override
  Widget build(BuildContext context) {
    return QudsPopupButton(
      backgroundColor: Theme.of(context).dividerColor,
      tooltip: 'T',
      items: getMenuItems,
      child: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: const Icon(Icons.more_vert_rounded),
      ),
    );
  }
}
