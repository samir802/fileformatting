import 'dart:async';

import 'package:fileformatting/controllers/core_controller.dart';
import 'package:fileformatting/views/auth/login_screen.dart';
import 'package:fileformatting/views/dashboard/dash_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final c = Get.put(CoreController());
  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () async {
      if (c.isUserLoggedIn()) {
        Get.offAll(DashScreen());
      } else {
        Get.offAll(LogInScreen());
      }
    });
    super.onInit();
  }
}
