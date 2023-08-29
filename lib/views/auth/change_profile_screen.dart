import 'package:fileformatting/controllers/dashboard/change_profie_screen_controller.dart';
import 'package:fileformatting/utils/image_path.dart';
import 'package:fileformatting/widgets/custom/custom_textfield.dart';
import 'package:fileformatting/widgets/custom/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeProfile extends StatelessWidget {
  ChangeProfile({super.key});

  final c = Get.put(ChangeProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: (c.profile.value != null)
                          ? Image.file(
                              c.profile.value!,
                              fit: BoxFit.cover,
                              height: 120,
                              width: 120,
                            )
                          : const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage(ImagePath.profileLogo),
                            ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    c.pickImage();
                  },
                  child: const Text(
                    "Change avatar",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: "Name",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        hint: "Email",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        hint: "Phone",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                          title: "Update Profile", onTap: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
