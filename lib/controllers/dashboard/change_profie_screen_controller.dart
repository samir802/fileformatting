import 'dart:io';

import "package:async/async.dart";
import 'package:get/get.dart';

import 'package:path/path.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfileController extends GetxController {
  final keys = GlobalKey<FormState>;
  File path = File("");

  Rxn<File> profile = Rxn<File>();
  final picker = ImagePicker();

  void pickImage() async {
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    if (pickedImage != null) {
      profile.value = File(pickedImage.path);
      path = File(pickedImage.path);

      // String imageName = extractImagePath(pickedImage.path);
      // saveImage(File(pickedImage.path), imageName);
    }
  }

  // String extractImagePath(String path) {
  //   return path.split('/').last;
  // }

  // Future saveImage(File imagePath, String imageName) async {
  //   const savedImagePath = "../assets/images/";
  //   print(savedImagePath);
  //   // Create the folder if it doesn't exist
  //   // await Directory(savedImagePath).create(recursive: true);

  //   final newImagePath = savedImagePath + imageName;

  //   // Copy the image to the new path
  //   await imagePath.copy(newImagePath);

  //   print("Image saved to: $newImagePath");
  // }

  Future addImage(File imageFile) async {
// ignore: deprecated_member_use
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://192.168.1.66/kenny/uploads.php");

    var request = http.MultipartRequest("POST", uri);

    var multipartFile = http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));

    request.files.add(multipartFile);
  }
}
