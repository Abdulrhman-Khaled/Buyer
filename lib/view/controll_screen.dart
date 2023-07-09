// ignore_for_file: must_be_immutable

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:buyer/core/viewmodel/auth_view_model.dart';
import 'package:buyer/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../constatnts/colors.dart';
import '../core/viewmodel/control_view_model.dart';

class ControllScreen extends GetWidget<AuthViewModel> {
  const ControllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? const WelcomeScreen()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: GetBuilder<ControlViewModel>(
                  init: ControlViewModel(),
                  builder: (controller) => BottomNavyBar(
                    selectedIndex: controller.navBarValue,
                    backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                    iconSize: 27,
                    containerHeight: 7.h,
                    curve: Curves.linear,
                    onItemSelected: (index) {
                      controller.changeScreensNavBar(index);
                    },
                    items: <BottomNavyBarItem>[
                      BottomNavyBarItem(
                        icon: const Icon(Ionicons.home_outline),
                        title: const Text(
                          'Home Page',
                          textAlign: TextAlign.center,
                        ),
                        activeColor: AppColors.orange,
                        inactiveColor: AppColors.black,
                      ),
                      BottomNavyBarItem(
                        icon: const Icon(Ionicons.cart_outline),
                        title: const Text(
                          'Your Cart',
                          textAlign: TextAlign.center,
                        ),
                        textAlign: TextAlign.center,
                        activeColor: AppColors.orange,
                        inactiveColor: AppColors.black,
                      ),
                      BottomNavyBarItem(
                        icon: const Icon(Ionicons.person_outline),
                        title: const Text(
                          'Your Profile',
                          textAlign: TextAlign.center,
                        ),
                        activeColor: AppColors.orange,
                        inactiveColor: AppColors.black,
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
