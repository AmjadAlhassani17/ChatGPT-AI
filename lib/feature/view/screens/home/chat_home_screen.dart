import 'dart:async';
import 'package:chatgpt/feature/view/screens/home/widgets/chat_empty_widget.dart';
import 'package:chatgpt/feature/view/screens/home/widgets/chat_widget.dart';
import 'package:chatgpt/feature/view/screens/home/widgets/header_drawer_widget.dart';
import 'package:chatgpt/feature/view/screens/home/widgets/menu_item_drawer_widget.dart';
import 'package:chatgpt/feature/view/screens/home/widgets/pop_menu_model_widget.dart';
import 'package:chatgpt/utils/util/utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import '../../../core/assets_manger.dart';
import '../../../core/theme/color/color_manger.dart';
import '../../../model/chat_model.dart';
import '../../../view_model/home_view_model/home_view_model.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);
  static final HomeViewModel homeViewModel =
      Get.put(HomeViewModel(), permanent: true);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  late FocusNode focusNode;
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    focusNode = FocusNode();
    getConnectiity();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    subscription.cancel();
    super.dispose();
  }

  getConnectiity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() {
              isAlertSet = true;
            });
          }
        },
      );

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('NO Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: [
            TextButton(
              onPressed: () async {
                Get.back();
                setState(() {
                  isAlertSet = false;
                });
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  setState(() {
                    isAlertSet = true;
                  });
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: ColorManger.instance.seconderyColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderDrawer(),
                SizedBox(
                  height: 25.h,
                ),
                const MenuItemDrawer(),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorManger.instance.whiteColor),
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  ImagesManger.chatGptAI,
                  height: 30.h,
                  width: 30.w,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'ChatGPT AI',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 20.sp,
                      color: ColorManger.instance.whiteColor,
                    ),
              ),
            ],
          ),
          actions: [
            GetBuilder<HomeViewModel>(initState: (_) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ChatHomeScreen.homeViewModel.getModels();
              });
            }, builder: (logic) {
              if (ChatHomeScreen.homeViewModel.autogeneratedModels.isNotEmpty) {
                return DefaultTextStyle(
                  style: TextStyle(color: ColorManger.instance.whiteColor),
                  child: PopupMenuModelWidget(
                    getMenuItems: [
                      QudsPopupMenuSection(
                        backgroundColor: Theme.of(context).dividerColor,
                        titleText: 'Choose Model :',
                        leading: const Icon(
                          Icons.select_all_rounded,
                          size: 40,
                        ),
                        subItems: List<QudsPopupMenuBase>.generate(
                          ChatHomeScreen
                              .homeViewModel.autogeneratedModels.length,
                          (index) => QudsPopupMenuItem(
                            title: Text(
                              ChatHomeScreen
                                  .homeViewModel.autogeneratedModels[index].id!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 16.sp),
                            ),
                            onPressed: () {
                              logic.changeModel(
                                  newModel: ChatHomeScreen.homeViewModel
                                      .autogeneratedModels[index].id!);
                            },
                            leading: ChatHomeScreen.homeViewModel
                                        .autogeneratedModels[index].id! ==
                                    logic.model
                                ? const Icon(
                                    Icons.check,
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return PopupMenuModelWidget(
                  getMenuItems: [
                    QudsPopupMenuSection(
                      backgroundColor: ColorManger.instance.seconderyColor,
                      titleText: 'Choose Model :',
                      leading: const Icon(
                        Icons.select_all_rounded,
                        size: 40,
                      ),
                      subItems: List<QudsPopupMenuBase>.generate(
                        1,
                        (index) => QudsPopupMenuItem(
                          title: Center(
                            child: CircularProgressIndicator(
                              color: ColorManger.instance.whiteColor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                );
              }
            }),
          ],
        ),
        body: GetBuilder<HomeViewModel>(
          init: HomeViewModel(),
          builder: (logic) {
            return Column(
              children: [
                logic.chatScreenModel.isNotEmpty
                    ? Flexible(
                        child: ListView.builder(
                          controller: logic.scrollControllerList,
                          physics: const BouncingScrollPhysics(),
                          itemCount: logic.chatScreenModel.length,
                          itemBuilder: (context, index) {
                            return ChatWidget(
                              chatIndex:
                                  logic.chatScreenModel[index].chatIndex!,
                              msg: logic.chatScreenModel[index].msg!,
                            );
                          },
                        ),
                      )
                    : const ChatEmpty(),
                if (logic.isTyping) ...[
                  SpinKitThreeBounce(
                    size: 18,
                    color: ColorManger.instance.whiteColor,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
                Material(
                  color: Theme.of(context).hoverColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 3,
                            focusNode: focusNode,
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                            ),
                            controller: logic.tdTextAddingAd,
                            onSubmitted: (value) async {
                              if (logic.isTyping) {
                                Utils.instance.snackError(
                                    body:
                                        'You cant send a multiple messages at time.');
                                return;
                              }
                              if (logic.tdTextAddingAd.text.isEmpty) {
                                Utils.instance
                                    .snackError(body: 'Please type a message.');
                                return;
                              } else {
                                try {
                                  logic.changeStateTyping(typing: true);
                                  focusNode.unfocus();
                                  logic.chatScreenModel.add(ChatModel(
                                    msg: logic.tdTextAddingAd.text,
                                    chatIndex: 0,
                                  ));
                                  logic.tdTextAddingController =
                                      logic.tdTextAddingAd.text;
                                  logic.restController();
                                  logic.chatScreenModel.addAll(
                                      await ChatHomeScreen.homeViewModel
                                          .sendMessageAd(
                                    message: logic.tdTextAddingController,
                                    modelId: logic.model,
                                    maxTokens: 1000,
                                  ));
                                } catch (e) {
                                  Utils.instance.snackError(
                                      body: "Please wait Iam check problem.");
                                  logic.changeStateTyping(typing: false);
                                  Logger().e("Error in ChatHomeScreen : $e");
                                }
                              }
                            },
                            cursorColor: ColorManger.instance.primaryColor,
                            decoration: InputDecoration.collapsed(
                              hintText: "How Can I help you",
                              hintStyle: TextStyle(
                                color: ColorManger.instance.greyColor,
                              ),
                              filled: true,
                              fillColor: ColorManger.instance.transColor,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (logic.isTyping) {
                              Utils.instance.snackError(
                                  body:
                                      'You cant send a multiple messages at time.');
                              return;
                            }
                            if (logic.tdTextAddingAd.text.isEmpty) {
                              Utils.instance
                                  .snackError(body: 'Please type a message.');
                              return;
                            } else {
                              try {
                                logic.changeStateTyping(typing: true);
                                focusNode.unfocus();
                                logic.chatScreenModel.add(ChatModel(
                                  msg: logic.tdTextAddingAd.text,
                                  chatIndex: 0,
                                ));
                                logic.tdTextAddingController =
                                    logic.tdTextAddingAd.text;
                                logic.restController();
                                logic.chatScreenModel.addAll(
                                    await ChatHomeScreen.homeViewModel
                                        .sendMessageAd(
                                  message: logic.tdTextAddingController,
                                  modelId: logic.model,
                                  maxTokens: 1000,
                                ));
                              } catch (e) {
                                Utils.instance.snackError(
                                    body: "Please wait Iam check problem.");
                                logic.changeStateTyping(typing: false);
                                Logger().e("Error in ChatHomeScreen : $e");
                              }
                            }
                          },
                          icon: Icon(
                            Icons.send,
                            color: ColorManger.instance.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}