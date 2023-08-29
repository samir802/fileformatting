import 'package:fileformatting/views/auth/login_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => LogInScreen());
    });
    super.onInit();
  }
}
