import 'dart:io';

import "package:async/async.dart";
import 'package:fileformatting/utils/custom_snackbar.dart';
import 'package:get/get.dart';

import 'package:path/path.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfileController extends GetxController {
  final keys = GlobalKey<FormState>;
  File paths = File("");

  Rxn<File> profile = Rxn<File>();
  final picker = ImagePicker();

  void pickImage() async {
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    if (pickedImage != null) {
      profile.value = File(pickedImage.path);
      paths = File(pickedImage.path);
    }
  }

  Future addImage(File imageFile) async {
// ignore: deprecated_member_use
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://192.168.1.66/kenny/uploads.php");

    var request = http.MultipartRequest("POST", uri);

    var multipartFile = http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));

    request.files.add(multipartFile);
    var respond = await request.send();
    if (respond.statusCode == 200) {
      CustomSnackBar.success(
          title: "Upload", message: "Image Uploaded Successfully");
    } else {
      CustomSnackBar.error(title: "Upload", message: "Image Uploaded Failed");
    }
  }
}