import 'package:fileformatting/utils/image_path.dart';
import 'package:fileformatting/views/auth/change_profile_screen.dart';
import 'package:fileformatting/widgets/custom/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(ImagePath.profileLogo),
              radius: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left:50.0,right: 50.0),
              child: CustomElevatedButton(
                  title: "Edit Profile",
                  onTap: () {
                    Get.to(ChangeProfile());
                  }),
            )
          ],
        ),
      )),
    );
  }
}
