import 'package:buyer/core/viewmodel/auth_view_model.dart';
import 'package:buyer/view/Home%20Screen/home_screen.dart';
import 'package:buyer/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllScreen extends GetWidget<AuthViewModel> {
  const ControllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeScreen()
          : const WelcomeScreen();
    });
  }
}
