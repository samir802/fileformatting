import 'package:fileformatting/repo/register_repo.dart';
import 'package:fileformatting/utils/custom_snackbar.dart';
import 'package:fileformatting/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class RegisterScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool passwordObscure = true.obs;

  final passwordController = TextEditingController();

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNoController = TextEditingController();

  RxBool isChecked = false.obs;
  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait..");
      await RegisterRepo.register(
          email: emailController.text,
          name: fullNameController.text,
          phoneNumber: phoneNoController.text,
          password: passwordController.text,
          onSuccess: (message) async {
            loading.hide();
            CustomSnackBar.success(
                title: "Register", message: "Register Successful");
            Get.offAll(() => LogInScreen());
          },
          onError: (message) {
            loading.hide();
            CustomSnackBar.error(title: "Register", message: message);
          });
    }
  }
}
