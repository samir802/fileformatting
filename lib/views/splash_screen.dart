import 'package:fileformatting/controllers/splash_controller.dart';
import 'package:fileformatting/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final c = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Image(
                image: AssetImage(ImagePath.splashLogo),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
