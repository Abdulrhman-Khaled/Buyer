// ignore_for_file: avoid_print, unnecessary_overrides

import 'package:buyer/constatnts/colors.dart';
import 'package:buyer/model/user_model.dart';
import 'package:buyer/view/Home%20Screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isVisible = false.obs;

  String? email, password, passwordConfirm, name;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  void toggleObscure() {
    isVisible.value = !isVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignIn() async {
    try {
      final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await _auth
          .signInWithCredential(credential)
          .then((user) => saveUser(user));
      Get.offAll(() => HomeScreen(),
          duration: const Duration(milliseconds: 700),
          transition: Transition.zoom);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error with Sign In !', e.toString(),
          backgroundColor: Colors.red,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void emailAndPassSignIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email ?? "xxx", password: password ?? "xxx");
      Get.offAll(() => HomeScreen(),
          duration: const Duration(milliseconds: 700),
          transition: Transition.zoom);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error with Sign In !', e.toString(),
          backgroundColor: Colors.red,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void emailAndPassSignUp() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) => saveUser(user));

      Get.offAll(() => HomeScreen(),
          duration: const Duration(milliseconds: 700),
          transition: Transition.zoom);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error with Sign In !', e.toString(),
          backgroundColor: Colors.red,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user!.uid,
        name: name ?? user.user?.displayName,
        email: user.user!.email,
        pic: ''));
  }
}
