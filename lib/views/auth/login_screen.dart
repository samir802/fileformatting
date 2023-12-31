import 'package:fileformatting/controllers/auth/login_controller.dart';
import 'package:fileformatting/utils/colors.dart';
import 'package:fileformatting/utils/image_path.dart';
import 'package:fileformatting/utils/validator.dart';
import 'package:fileformatting/views/auth/register_screen.dart';
import 'package:fileformatting/widgets/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final c = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: Get.height / 1.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(1), BlendMode.dstATop),
                      image: const AssetImage(ImagePath.loginBGImage),
                      fit: BoxFit.fill),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: Get.width / 1,
                    height: Get.height / 3,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 70),
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage(ImagePath.profileLogo),
                              radius: 40),
                          SizedBox(height: 5),
                          Text(
                            "Flutter UI",
                            style: TextStyle(
                                color: AppColors.tertiaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "A journey of a thousand miles begins with a single step.",
                              maxLines: 2,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 214, 211, 211),
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width / 1,
                    height: Get.height / 1.6,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          const Text(
                            "Log in",
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: c.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Your Email",
                                    style: TextStyle(fontSize: 16)),
                                const SizedBox(height: 5),
                                CustomTextField(
                                    controller: c.emailController,
                                    preIconPath: Icons.mail,
                                    hint: "FlutterUI@gmail.com",
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.emailAddress,
                                    validator: Validators.checkEmailField),
                                const SizedBox(height: 20),
                                const Text("Your Password",
                                    style: TextStyle(fontSize: 16)),
                                const SizedBox(height: 5),
                                CustomTextField(
                                    controller: c.passwordController,
                                    preIconPath: Icons.key,
                                    hint: "******",
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.name,
                                    validator: Validators.checkPasswordField),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      side:
                                          const BorderSide(color: Colors.black),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Skip",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17)),
                                        SizedBox(width: 8),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            color: Colors.black, size: 13)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      c.onSubmit();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 46, 46, 46),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Login",
                                              style: TextStyle(fontSize: 17)),
                                          SizedBox(width: 8),
                                          Icon(Icons.arrow_forward, size: 20),
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?"),
                              TextButton(
                                  onPressed: () {
                                    Get.offAll(() => RegisterScreen());
                                  },
                                  child: const Text(
                                    "Sign Up Now",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 46, 46, 46)),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
