import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var image = Rx<File?>(null);
  final productNameController = TextEditingController();
  final priceController = TextEditingController();
  final itemCountController = TextEditingController();
  final colorController = TextEditingController();
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      log('No image selected.');
    }
  }
}
