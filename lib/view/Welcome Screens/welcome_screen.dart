
import 'package:buyer/viewmodel/auth_view_model.dart';

import 'package:buyer/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Auth Screens/sign_in_screen.dart';
import '../Auth Screens/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return GetBuilder<AuthViewModel>(
        init: Get.find<AuthViewModel>(),
        builder: (controller) => Scaffold(
              body: Stack(
                children: [
                  Image(
                    image: const AssetImage("assets/images/welcome.png"),
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Text(
                            'All what you want \nin one place',
                            style: GoogleFonts.rubik(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Text(
                            'Shop around the world with \nmore than 1000 brands',
                            style: GoogleFonts.rubik(
                                fontSize: 16.sp, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: filledButton(
                            buttonText: 'Get Started',
                            height: 50,
                            width: 100.w,
                            function: () {
                              Get.to(() => SignUpScreen(),
                                  duration: const Duration(
                                      milliseconds:
                                          700), //duration of transitions, default 1 sec
                                  transition: Transition.zoom);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: outlineButton(
                            buttonText: 'Sign In',
                            buttonColor: Colors.white,
                            buttonTextColor: Colors.white,
                            height: 50,
                            width: 100.w,
                            function: () {
                              Get.to(() => SignInScreen(),
                                  duration: const Duration(
                                      milliseconds:
                                          700), //duration of transitions, default 1 sec
                                  transition: Transition.zoom);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
