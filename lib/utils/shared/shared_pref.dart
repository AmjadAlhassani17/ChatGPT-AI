// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constance/constance.dart';

class SharedPref {
  static SharedPref instance = SharedPref._();
  final String userLanguageKey = "userLanguage";
  final String tokenKey = "token";
  final String themeKey = "themeKey";
  final String userOnbordingKey = "userOnbordingKey";

  SharedPref._();

  static SharedPreferences? _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getUserToken() {
    return _prefs?.getString(tokenKey);
  }

  setUserLanguage({required String newLanguage}) {
    try {
      _prefs?.setString(userLanguageKey, newLanguage);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String getUserLanguage() {
    return _prefs?.getString(userLanguageKey) ?? Constance.english;
  }

  setThemeApp({required bool newTheme}) {
    try {
      _prefs?.setBool(themeKey, newTheme);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool getThemeApp() {
    // false mean ligth
    return _prefs?.getBool(themeKey) ?? false;
  }

  setUserOnbording({required bool newValue}) {
    try {
      _prefs?.setBool(userOnbordingKey, newValue);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool getUserOnbording() {
    return _prefs?.getBool(userOnbordingKey) ?? false;
  }
}
