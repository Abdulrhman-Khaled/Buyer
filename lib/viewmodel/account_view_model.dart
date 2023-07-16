// ignore_for_file: prefer_final_fields

import 'package:buyer/utils/database/local_database_helper.dart';
import 'package:buyer/view/Welcome%20Screens/welcome_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user_model.dart';

class AccountViewModel extends GetxController {
  final LocaleDatabaseHelper localeDatabaseHelper = LocaleDatabaseHelper();

  UserModel _userModel = UserModel();

  UserModel get userModel => _userModel;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localeDatabaseHelper.deleteUser();
    Get.offAll(() => const WelcomeScreen(),
        duration: const Duration(milliseconds: 700),
        transition: Transition.noTransition);
    Get.snackbar('Process Successful', 'You have Signed out successfully.',
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localeDatabaseHelper.getUser.then((value) {
      _userModel = value!;
    });
    _loading.value = false;
    update();
  }
}
