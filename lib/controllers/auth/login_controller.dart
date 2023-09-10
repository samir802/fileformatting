import 'package:fileformatting/controllers/core_controller.dart';
import 'package:fileformatting/repo/login_repo.dart';
import 'package:fileformatting/utils/custom_snackbar.dart';
import 'package:fileformatting/utils/storage_keys.dart';
import 'package:fileformatting/views/dashboard/dash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'dart:convert';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool passwordObscure = true.obs;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  RxBool isChecked = false.obs;
  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait..");
      await LoginRepo.login(
          email: emailController.text,
          password: passwordController.text,
          onSuccess: ((user, token) async {
            loading.hide();
            final box = GetStorage();
            await box.write(StorageKeys.USER, json.encode(user.toJson()));
            await box.write(
                StorageKeys.ACCESS_TOKEN, json.encode(user.toJson()));
            Get.find<CoreController>().loadCurrentUser();
            Get.offAll(() => DashScreen());
            CustomSnackBar.success(
                title: "Login", message: "Login Successfully");
          }),
          onError: (message) {
            loading.hide();
            CustomSnackBar.error(title: "Login", message: message);
          });
    }
  }
}
