// ignore_for_file: unused_field, invalid_return_type_for_catch_error, unnecessary_null_comparison, prefer_if_null_operators

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../utils/shared/local_user_data.dart';
import '../../../utils/util/utils.dart';
import '../../model/user_model.dart';
import '../../view/screens/auth/logIn/login_screen.dart';
import '../../view/screens/control/control.dart';
import 'fire_store_user.dart';

class AuthViewModel extends GetxController {
  TextEditingController tdEmailLogIn = TextEditingController();
  TextEditingController tdPasswordLogIn = TextEditingController();

  //to do this , for Loading::
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    update();
  }

  endLoading() {
    isLoading = false;
    update();
  }

  restLogInController() {
    tdEmailLogIn.clear();
    tdPasswordLogIn.clear();
  }

  TextEditingController tdNameSignUp = TextEditingController();
  TextEditingController tdEmailSignUp = TextEditingController();
  TextEditingController tdPasswordSignUp = TextEditingController();
  TextEditingController tdConfirmPasswordSignUp = TextEditingController();

  restSignUpController() {
    tdNameSignUp.clear();
    tdEmailSignUp.clear();
    tdPasswordSignUp.clear();
    tdConfirmPasswordSignUp.clear();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'https://www.googleapis.com/auth/plus.login',
    'https://www.googleapis.com/auth/userinfo.email'
  ]);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static LocalStorageData localStorageData =
      Get.put(LocalStorageData(), permanent: true);
  String? image;
  final Rx<User?> _user = Rx<User?>(null);
  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentData(_auth.currentUser!.uid);
    }
  }

  // sign in by google
  void googleSignInMethod() async {
    try {
      startLoading();
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn
          .signIn()
          .catchError((onError) => Logger().i(onError));

      if (googleSignInAccount == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential).then((user) async {
        saveUser(user);
        Get.offAll(() => const ControlView());
        endLoading();
      }).catchError((onError) => Logger().i(onError));
    } catch (e) {
      Utils.instance.snackError(title: 'Error login account', body: '$e');
      endLoading();
    }
  }

  // sign in Facebook
  Future<void> signInWithFacebook() async {
    try {
      startLoading();
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        // Once signed in, return the UserCredential
        return FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential)
            .then((user) async {
          saveUser(user);
          Get.offAll(() => const ControlView());
          endLoading();
        }).catchError((onError) => Logger().i(onError));
      }
    } catch (e) {
      Utils.instance.snackError(title: 'Error login account', body: '$e');
      endLoading();
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      startLoading();
      await _auth
          .signInWithEmailAndPassword(
              email: tdEmailLogIn.text, password: tdPasswordLogIn.text)
          .then((value) async {
        tdEmailLogIn.clear();
        tdPasswordLogIn.clear();
        getCurrentData(value.user!.uid);
      });

      Get.offAll(() => const ControlView());
      restLogInController();
      endLoading();
    } catch (e) {
      Utils.instance.snackError(title: 'Error login account', body: '$e');
      endLoading();
    }
  }

  void creatAccountWithEmailAndPassword() async {
    try {
      startLoading();
      await _auth
          .createUserWithEmailAndPassword(
              email: tdEmailSignUp.text, password: tdPasswordSignUp.text)
          .then((user) async {
        user.user?.updateDisplayName(tdNameSignUp.text);
        saveUser(user);
        tdEmailSignUp.clear();
        tdPasswordSignUp.clear();
        tdNameSignUp.clear();
        tdConfirmPasswordSignUp.clear();
      });

      Get.offAll(() => LogInScreen());
      restSignUpController();
      endLoading();
    } catch (e) {
      Utils.instance.snackError(title: 'Error login account', body: '$e');
      endLoading();
    }
  }

  // save data user in firebase
  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: user.user!.displayName == null
          ? tdNameSignUp.text
          : user.user!.displayName,
      image: user.user!.photoURL == null
          ? Utils.instance.urlUserPlacholder
          : user.user!.photoURL,
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  void getCurrentData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
    });
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FacebookAuth.instance.logOut();
    FirebaseAuth.instance.signOut();
  }
}
