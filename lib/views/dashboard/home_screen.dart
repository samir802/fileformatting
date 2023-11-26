import 'package:fileformatting/controllers/dashboard/change_profie_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/image_path.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final c = Get.put(ChangeProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
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
                            backgroundImage: AssetImage(ImagePath.profileLogo),
                          ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  c.pickImage();
                  c.addImage(c.path);
                },
                child: const Text(
                  "Change avatar",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
