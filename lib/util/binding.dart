import 'package:buyer/core/viewmodel/home_view_model.dart';
import 'package:get/get.dart';

import '../core/viewmodel/auth_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
  }
}
