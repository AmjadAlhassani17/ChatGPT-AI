import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../utils/shared/shared_pref.dart';

abstract class ConstanceNetwork {
  static Logger log = Logger();

  ///todo here insert base_url
  static var baseUrl = "https://api.openai.com/v1/";
  static var models = "models";
  static var sendMessage = "completions";
  // ignore: non_constant_identifier_names
  static var API_KEY  = "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";



  static Map<String, String> header(TypeToken token) {
    Map<String, String> headers = {};
    if (token == TypeToken.contentType) {
      headers = {
        // 'Content-Type': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
    } else if (token == TypeToken.authorization) {
      headers = {
        'Authorization': 'Bearer $API_KEY',
      };
    } else if (token == TypeToken.authorizationContentType) {
      headers = {
        'Authorization': 'Bearer $API_KEY',
        'Content-Type': 'application/json',
      };
    } else if (token == TypeToken.acceptLanguage) {
      headers = {
        'Accept-Language': SharedPref.instance.getUserLanguage(),
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
    }
    return headers;
  }

  static String getThrowableErrorMsg(DioErrorType throwable) {
    String message;
    if (throwable == DioErrorType.response) {
      log.e("error", "HttpException");
      message = "Interval Server Error";
    } else if (throwable == DioErrorType.other) {
      message = "UnauthorizedException";
      // _showMyDialog(Get.context!);
      log.e("error", "UnauthorizedException");
    } else if (throwable == DioErrorType.connectTimeout ||
        throwable == DioErrorType.receiveTimeout ||
        throwable == DioErrorType.sendTimeout) {
      message = "SocketTimeoutException";
      log.e("error", "SocketTimeoutException");
    } else if (throwable == DioErrorType.cancel) {
      log.e("error", "IOException");
      message = "IOException";
    } else {
      log.e("error", throwable.toString());
      message = throwable.toString();
    }
    return message;
  }
}

enum TypeToken {
  //todo this for application/json
  contentType,
  //todo this for Authorization Bearer
  authorization,
  //todo this for Authorization Bearer &&  Content_Type
  authorizationContentType,
  //
  acceptLanguage
}
