import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfileController extends GetxController{
  final keys = GlobalKey<FormState>;

  Rxn<File> profile = Rxn<File>();
  final picker = ImagePicker();

  void pickImage() async{
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 500,
      maxWidth: 500);
    if(pickedImage != null){
      profile.value = File(pickedImage.path);
    }
  }

}