import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  /// ---------------------- OBSERVABLES ----------------------
  Rx<File?> profileImage = Rx<File?>(null);

  RxString userDob = "".obs;
  RxString userGender = "".obs;

  /// ---------------------- TEXT CONTROLLERS ----------------------
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  /// ---------------------- IMAGE PICKER ----------------------
  Future<void> pickImage() async {
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      profileImage.value = File(img.path);
    }
  }

  /// ---------------------- UPDATE METHODS ----------------------
  void updateName(String value) {
    fullNameController.text = value;
  }

  void updateEmail(String value) {
    userEmailController.text = value;
  }

  void updatePhone(String value) {
    userPhoneController.text = value;
  }

  void updateDob(String formattedDate) {
    userDob.value = formattedDate;
  }

  void updateGender(String gender) {
    userGender.value = gender;
  }

  /// ---------------------- SAVE METHOD ----------------------
  void saveProfile() {
    print("Name: ${fullNameController.text}");
    print("Email: ${userEmailController.text}");
    print("Phone: ${userPhoneController.text}");
    print("DOB: ${userDob.value}");
    print("Gender: ${userGender.value}");
    print("Image: ${profileImage.value}");

    // API hit karo yaha agar chahiye
  }
}
