import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nzcu_user/controller/edit_profile_controller.dart';

import 'package:nzcu_user/utils/custom_images.dart';
import 'package:nzcu_user/utils/with_animations/app_buttons.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';
import 'package:nzcu_user/utils/with_animations/form_field.dart';
import 'package:nzcu_user/utils/with_animations/navigator.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(EditProfileController());

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(Duration(days: 18 * 365)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryblue,
              onPrimary: Colors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      controller.userDob.value = _dateFormat.format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        titleSpacing: w * .03,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                CustomNavigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: w * .06,
                color: AppColors.black,
              ),
            ),
            SizedBox(width: w * .02),
            AppFonts.textPoppins(
              context,
              "Edit",
              w * .05,
              FontWeight.w500,
              AppColors.black,
              TextAlign.start,
              TextOverflow.visible,
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: w * .04),

              /// ---------------- PROFILE IMAGE ----------------
              Obx(
                () => Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: w * .15,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: controller.profileImage.value != null
                            ? FileImage(controller.profileImage.value!)
                            : const AssetImage("assets/images/nzcuCar.png")
                                  as ImageProvider,
                      ),

                      Positioned(
                        bottom: w * .002,
                        right: w * .09,
                        child: GestureDetector(
                          onTap: () => controller.pickImage(),
                          child: CustomImages.images(
                            "assets/icons/editIcon.png",
                            w * .06,
                            w * .06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .035,
                  vertical: w * .04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ---------------- FULL NAME ----------------
                    label(context, "Full Name", w),
                    AppFormFields.custTextFormOther(
                      context: context,
                      controller: controller.fullNameController,
                      hintText: "Enter your name here",
                      onChanged: (v) => controller.updateName(v),
                    ),

                    /// ---------------- MOBILE NUMBER ----------------
                    label(context, "Mobile number", w),
                    AppFormFields.custTextFormOther(
                      context: context,
                      controller: controller.userPhoneController,
                      hintText: "8344661034",
                      readOnly: true,
                    ),

                    /// ---------------- EMAIL ----------------
                    label(context, "Email", w),
                    AppFormFields.custTextFormOther(
                      context: context,
                      controller: controller.userEmailController,
                      hintText: "xyz_email.com",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (v) => controller.updateEmail(v),
                    ),

                    /// ---------------- DOB ----------------
                    label(context, "Date of birth", w),
                    Obx(
                      () => GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: w * .03,
                              vertical: w * .035,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.mediumGray),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppFonts.textPoppins(
                                  context,
                                  controller.userDob.value.isEmpty
                                      ? "DD/MM/YYYY"
                                      : controller.userDob.value,
                                  w * .036,
                                  FontWeight.w600,
                                  controller.userDob.value.isEmpty
                                      ? Colors.grey.shade500
                                      : AppColors.black,
                                  TextAlign.start,
                                  TextOverflow.visible,
                                ),
                                Icon(
                                  Icons.calendar_today,
                                  color: AppColors.black,
                                  size: w * .05,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// ---------------- GENDER ----------------
                    label(context, "Gender", w),
                    Obx(
                      () => Container(
                        width: w,
                        padding: EdgeInsets.symmetric(horizontal: w * .03),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.mediumGray),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.userGender.value.isEmpty
                                ? null
                                : controller.userGender.value,
                            hint: Text(
                              "Select Gender",
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: ["Male", "Female", "Other"]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) =>
                                controller.userGender.value = val!,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: w * .1),

                    /// ---------------- UPDATE BUTTON ----------------
                    AppButtons.solid(
                      context: context,
                      width: w,
                      text: "Profile Update",
                      textColor: AppColors.black,
                      onClicked: () {
                        // controller.saveProfile();
                        // Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget label(BuildContext context, String text, double w) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: w * .02),
      child: AppFonts.textPoppins(
        context,
        text,
        w * .035,
        FontWeight.w500,
        AppColors.black,
        TextAlign.start,
        TextOverflow.visible,
      ),
    );
  }
}
