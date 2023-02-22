import 'package:logger/logger.dart';

class AppResponse {
  String? object;
  dynamic data;

  AppResponse({this.object, this.data});

  factory AppResponse.fromJson(Map<String, dynamic> map) => AppResponse(
        object: map["object"],
        data: map["data"],
      );

  Map<String, dynamic> toJson() {
    try {
      return {"object": object, "data": data};
    } catch (e) {
      Logger().e(e);
      return {"": ""};
    }
  }
}
