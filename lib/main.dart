import 'package:chatgpt/fcm/notification_service.dart';
import 'package:chatgpt/firebase_options.dart';
import 'package:chatgpt/utils/shared/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'feature/core/app_widget.dart';
import 'network/api/dio_manager/dio_manage_class.dart';

// ignore: unused_element
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  NotificationService.instance.messageHandler(message, isBackground: true);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPref.instance.init();
  DioManagerClass.getInstance.init();
  NotificationService.instance.init();
  runApp(const AppWidget());
}
