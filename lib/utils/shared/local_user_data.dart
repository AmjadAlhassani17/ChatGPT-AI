import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../feature/model/user_model.dart';
import '../constance/constance.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      // ignore: unnecessary_null_comparison
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(Constance.instance.chatchUserData);
    return UserModel.fromJson(json.decode(value as String));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        Constance.instance.chatchUserData, json.encode(userModel.toJson()));
  }

  void deletUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
