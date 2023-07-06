import 'package:buyer/util/binding.dart';
import 'package:buyer/view/controll_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        home: const Scaffold(
          body: ControllScreen(),
        ),
        theme: ThemeData(
          primarySwatch: orangeMaterial,
        ),
      );
    });
  }
}

Map<int, Color> mainColor = {
  50: const Color.fromRGBO(255, 96, 0, .1),
  100: const Color.fromRGBO(255, 96, 0, .2),
  200: const Color.fromRGBO(255, 96, 0, .3),
  300: const Color.fromRGBO(255, 96, 0, .4),
  400: const Color.fromRGBO(255, 96, 0, .5),
  500: const Color.fromRGBO(255, 96, 0, .6),
  600: const Color.fromRGBO(255, 96, 0, .7),
  700: const Color.fromRGBO(255, 96, 0, .8),
  800: const Color.fromRGBO(255, 96, 0, .9),
  900: const Color.fromRGBO(255, 96, 0, 1),
};
MaterialColor orangeMaterial = MaterialColor(0xFFFF6000, mainColor);
