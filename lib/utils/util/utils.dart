// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../feature/core/theme/color/color_manger.dart';
import '../constance/constance.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;
import 'dart:ui' as ui;

class Utils {
  Utils._();

  static Utils instance = Utils._();

  mainSnack({String? title, required String body, Color? backgroundColor}) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: backgroundColor ?? const Color(0xFF303030),
        message: body,
        duration: const Duration(seconds: 2),
        borderRadius: 10,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }

  snackSuccess({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: ColorManger.instance.successColor);
  }

  snackError({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: ColorManger.instance.errorColor);
  }

  bool isValidatePassword({required String password}) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  BouncingScrollPhysics getIosScroll() {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }

  changeStatusBar(
      {required Color statusBarColor,
      required Color systemNavigationBarColor}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorManger.instance.transColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: ColorManger.instance.primaryColor));
  }

  String urlUserPlacholder =
      "https://jenalk.ahdtech.com/dev/assets/img/no-user.png";
  String controllPanelImage =
      "https://images.unsplash.com/photo-1515378960530-7c0da6231fb1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80";
  String newDeliveryImage =
      "https://media.istockphoto.com/photos/smart-warehouse-management-system-with-innovative-internet-of-things-picture-id1334427520?b=1&k=20&m=1334427520&s=170667a&w=0&h=OrI-uvSqzdDJV5Nx7nTekjH3baQWvLircpM9o_NAjUI=";
  String myBillsImage =
      "https://media.istockphoto.com/photos/woman-using-banking-app-on-the-smartphone-pay-utility-bill-financial-picture-id1331910730?b=1&k=20&m=1331910730&s=170667a&w=0&h=QlBX-Ep7vnd0aQFSb0J87Vfr4bWmRXMN2YkQmSljLZA=";

  String botikFashinImage =
      "https://images.unsplash.com/photo-1537832816519-689ad163238b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60";
  String torkishResturantImage =
      "https://images.unsplash.com/file-1636585210491-f28ca34ea8ecimage";
  String imagePlaceHolder =
      "https://images.unsplash.com/photo-1648737155328-0c0012cf2f20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80";
  String manImage =
      "https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80";
  String livePlaceHolder =
      "https://images.unsplash.com/photo-1650820356910-2fc6e52eb2cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80";
  String newImageFlowers =
      "https://images.unsplash.com/photo-1651109279178-bb23510d2678?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80";
  String visaImage =
      "https://toppng.com/uploads/preview/visa-us-vector-logo-free-download-11574017219rwlbxkijxr.png";

  Widget imageNetwork(
      {double? width, double? height, String? url, BoxFit? fit}) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(url ?? urlUserPlacholder),
              fit: fit ?? BoxFit.cover,
            ),
          ),
        );
      },
      imageUrl: urlUserPlacholder,
      errorWidget: (context, url, error) {
        return CachedNetworkImage(
            imageUrl: urlUserPlacholder,
            errorWidget: (context, url, error) {
              return const SizedBox(
                height: 80,
                width: 80,
                child: Text("data"),
              );
            },
            fit: BoxFit.contain);
      },
      width: width ?? 74,
      height: height ?? 74,
      fit: BoxFit.cover,
      placeholder: (context, String? url) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/gifs/loading_shimmer.gif"),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                )),
          ),
        );
      },
    );
  }

  String getDurationString(double value) {
    var seconds = value.truncate();
    var minutes = (seconds / 60).truncate();
    return '$minutes : $seconds';
  }

  bool isArabic() {
    return Get.locale?.languageCode == Constance.arabic;
  }

  bool isDarkMode() {
    return Get.isDarkMode;
  }

  Future<void> openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<String?> download(String url) async {
    dio.Response response = await dio.Dio().get(
      url,
      options: dio.Options(
          responseType: dio.ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return (status ?? 0) < 500;
          }),
    );
    String imageName = path.basename(url);
    Directory appDir = await path_provider.getApplicationDocumentsDirectory();
    String localPath = path.join(appDir.path, imageName);
    File imageFile = File(localPath);
    var raf = imageFile.openSync(mode: FileMode.write);
    //  response.data is List<int>;
    raf.writeFromSync(response.data);
    await raf.close();
    return localPath;
  }

  String getBase64FormateFile(String path) {
    File file = File(path);
      debugPrint('File is = ' + file.toString());
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte,);
    return fileInBase64;
  }


  Future<Uint8List> getBytesFormateFile(String path) async {
    File file = File(path);
    debugPrint('File is = ' + file.toString());
    Uint8List bytes =  file.readAsBytesSync();
    ByteData data = ByteData.view(bytes.buffer);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 100 , targetHeight: 100);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  
}
