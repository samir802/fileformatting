import 'package:fileformatting/controllers/auth/register_controller.dart';
import 'package:fileformatting/utils/colors.dart';
import 'package:fileformatting/utils/custom_text_style.dart';
import 'package:fileformatting/utils/validator.dart';
import 'package:fileformatting/views/auth/login_screen.dart';
import 'package:fileformatting/widgets/custom/custom_password_fields.dart';
import 'package:fileformatting/widgets/custom/custom_textfield.dart';
import 'package:fileformatting/widgets/custom/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register-screen";
  RegisterScreen({super.key});
  final c = Get.put(RegisterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              Form(
                  key: c.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register Here",
                        style: CustomTextStyles.f16W600(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Full Name",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        validator: Validators.checkFieldEmpty,
                        controller: c.fullNameController,
                        hint: "Full Name",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                      ),
                      Text(
                        "Email Address",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        validator: Validators.checkEmailField,
                        controller: c.emailController,
                        hint: "Email",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Phone No",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        validator: Validators.checkPhoneField,
                        controller: c.phoneNoController,
                        hint: "Phone No",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                        () => CustomPasswordField(
                          validator: Validators.checkPasswordField,
                          hint: "Password",
                          eye: c.passwordObscure.value,
                          onEyeClick: c.onEyeCLick,
                          controller: c.passwordController,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Confirm Password",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                        () => CustomPasswordField(
                          validator: Validators.checkPasswordField,
                          hint: "Confirm Password",
                          eye: c.passwordObscure.value,
                          onEyeClick: c.onEyeCLick,
                          controller: c.passwordController,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              CustomElevatedButton(
                  title: "Register",
                  onTap: () {
                    c.onSubmit();
                  }),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: CustomTextStyles.f14W400()),
                  TextButton(
                      onPressed: () {
                        Get.offAll(() => LogInScreen());
                      },
                      child: Text(
                        "Login",
                        style: CustomTextStyles.f14W400(
                            color: AppColors.primaryColor),
                      )),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}