import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/util/utils.dart';
import '../../../../core/theme/color/color_manger.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManger.instance.primaryColor,
      padding: EdgeInsets.only(top: 50.h),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Utils.instance.imageNetwork(
              url: FirebaseAuth.instance.currentUser?.photoURL ??
                  Utils.instance.urlUserPlacholder,
              height: 100.h,
              width: 100.w,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            '${FirebaseAuth.instance.currentUser?.displayName}',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 20.sp, color: Theme.of(context).focusColor),
          ),
          Text(
            '${FirebaseAuth.instance.currentUser?.email}',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 12.sp, color: Theme.of(context).focusColor),
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
