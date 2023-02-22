import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../view_model/home_view_model/home_view_model.dart';
import 'container_empty_chat_screen_widget.dart';

class ChatEmpty extends StatelessWidget {
  const ChatEmpty({super.key});

  static final HomeViewModel homeViewModel =
      Get.put(HomeViewModel(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const Icon(
              Icons.light_mode_outlined,
            ),
            SizedBox(
              height: 5.w,
            ),
            Text(
              'Examples',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.w,
            ),
            GetBuilder<HomeViewModel>(
                init: HomeViewModel(),
                builder: (logic) {
                  return ContainerEmptyChatScreen(
                    text: '"Explain quantum computing in simple terms"  →',
                    onTap: () {
                      logic.tdTextAddingAd.text =
                          'Explain quantum computing in simple terms';
                    },
                  );
                }),
            SizedBox(
              height: 15.w,
            ),
            GetBuilder<HomeViewModel>(
                init: HomeViewModel(),
                builder: (logic) {
                  return ContainerEmptyChatScreen(
                    text:
                        '"Got any creative ideas for a 10 year old’s birthday?"  →',
                    onTap: () {
                      logic.tdTextAddingAd.text =
                          'Got any creative ideas for a 10 year old’s birthday?';
                    },
                  );
                }),
            SizedBox(
              height: 15.w,
            ),
            GetBuilder<HomeViewModel>(
                init: HomeViewModel(),
                builder: (logic) {
                  return ContainerEmptyChatScreen(
                    text: '"How do I make an HTTP request in Javascript?"  →',
                    onTap: () {
                      logic.tdTextAddingAd.text =
                          'How do I make an HTTP request in Javascript?';
                    },
                  );
                }),
            SizedBox(
              height: 25.w,
            ),
            const Icon(
              Icons.electric_bolt_outlined,
            ),
            SizedBox(
              height: 5.w,
            ),
            Text(
              'Capabilities',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.w,
            ),
            ContainerEmptyChatScreen(
              text: 'Remembers what user said earlier in the conversation',
              onTap: () {},
            ),
            SizedBox(
              height: 15.w,
            ),
            ContainerEmptyChatScreen(
              text: 'Allows user to provide follow-up corrections',
              onTap: () {},
            ),
            SizedBox(
              height: 15.w,
            ),
            ContainerEmptyChatScreen(
              text: 'Trained to decline inappropriate requests',
              onTap: () {},
            ),
            SizedBox(
              height: 25.w,
            ),
            const Icon(
              Icons.report_problem_outlined,
            ),
            SizedBox(
              height: 5.w,
            ),
            Text(
              'Limitations',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.w,
            ),
            ContainerEmptyChatScreen(
              text: 'May occasionally generate incorrect information',
              onTap: () {},
            ),
            SizedBox(
              height: 15.w,
            ),
            ContainerEmptyChatScreen(
              text:
                  'May occasionally produce harmful instructions or biased content',
              onTap: () {},
            ),
            SizedBox(
              height: 15.w,
            ),
            ContainerEmptyChatScreen(
              text: 'Limited knowledge of world and events after 2021',
              onTap: () {},
            ),
            SizedBox(
              height: 25.w,
            ),
          ],
        ),
      ),
    );
  }
}
