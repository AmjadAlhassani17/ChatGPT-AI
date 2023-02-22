import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt/feature/view/screens/home/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/util/utils.dart';
import '../../../../core/assets_manger.dart';
import '../../../../core/theme/color/color_manger.dart';
import '../../../../view_model/home_view_model/home_view_model.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.msg,
    required this.chatIndex,
  });

  final String msg;
  final int chatIndex;

  static final HomeViewModel homeViewModel =
      Get.put(HomeViewModel(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        children: [
          Material(
            color: chatIndex == 0
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).hoverColor,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 8.h, left: 8.w, bottom: 8.h, right: 8.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  chatIndex == 0
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Utils.instance.imageNetwork(
                            url: FirebaseAuth.instance.currentUser?.photoURL ??
                                Utils.instance.urlUserPlacholder,
                            height: 30.h,
                            width: 30.w,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Image.asset(
                          ImagesManger.chatLogo,
                          height: 30.h,
                          width: 30.w,
                        ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: chatIndex == 0
                        ? TextWidget(
                            lable: msg,
                            fontSize: 16.sp,
                          )
                        : DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).hintColor),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              displayFullTextOnTap: true,
                              totalRepeatCount: 1,
                              stopPauseOnTap: true,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  msg.trim(),
                                  speed: const Duration(milliseconds: 50),
                                  cursor: '_',
                                ),
                              ],
                            ),
                          ),
                  ),
                  chatIndex == 0
                      ? const SizedBox.shrink()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GetBuilder<HomeViewModel>(
                              init: HomeViewModel(),
                              builder: (logic) {
                                return Icon(
                                  logic.isLike
                                      ? Icons.thumb_up_alt
                                      : Icons.thumb_up_alt_outlined,
                                  color: ColorManger.instance.greyColor
                                      .withOpacity(0.7),
                                );
                              },
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GetBuilder<HomeViewModel>(
                              init: HomeViewModel(),
                              builder: (logic) {
                                return Icon(
                                  logic.isLike
                                      ? Icons.thumb_down_alt
                                      : Icons.thumb_down_alt_outlined,
                                  color: ColorManger.instance.greyColor
                                      .withOpacity(0.7),
                                );
                              },
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
