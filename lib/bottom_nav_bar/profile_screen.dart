import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nzcu_user/demo_screen.dart';
import 'package:nzcu_user/profile_related/edit_profile_screen.dart';
import 'package:nzcu_user/profile_related/refer_earn_screen.dart';
import 'package:nzcu_user/profile_related/safety_screen.dart';
import 'package:nzcu_user/utils/custom_images.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';
import 'package:nzcu_user/utils/with_animations/navigator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Auth authController = Get.find<Auth>();
  String imagePath = "assets/images/nzcuCar.png";
  List firstImagePathList = [
    "assets/icons/profilePayment.png",
    "assets/icons/profilePayment.png",
    "assets/icons/profileRefer.png",
    "assets/icons/profilePayment.png",
  ];
  List firstScreens = [
    DemoScreen(),
    // DemoScreen(),
    SafetyScreen(),
    ReferEarnScreen(),
    DemoScreen(),
  ];
  //? help-screens
  List secondScreens = [DemoScreen(), DemoScreen(), DemoScreen()];
  List secondImagePathList = [
    "assets/icons/profileHelp.png",
    "assets/icons/profileTerms.png",
    "assets/icons/profilePayment.png",
  ];
  List firstTitleList = ["Payment", "Safety", "Refer & Earn", "Notifications"];
  List secondTitleList = ["Help", "Terms & Conditions", "Privacy Policy"];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Center(
          child: AppFonts.textPoppins(
            context,
            "Profile",
            w * .055,
            FontWeight.w500,
            AppColors.black,
            TextAlign.start,
            TextOverflow.ellipsis,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .02),
          child: Column(
            children: [
              SizedBox(height: w * .03),
              // Obx(
              //   () =>
              Card(
                elevation: 1,
                color: AppColors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * .04,
                        vertical: w * .02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //    Obx(() {

                          //  final networkImage = authController
                          //     .userImage
                          //     .value; // API se milne wali image

                          // return
                          // CircleAvatar(
                          //   radius: w * .07,
                          //   backgroundColor: Colors.grey.shade300,
                          //   backgroundImage: networkImage.isNotEmpty
                          //       ? NetworkImage(networkImage)
                          //       : null, // agar API image available hai to dikhayega
                          //   child: networkImage.isEmpty
                          //       ?
                          ClipOval(
                            child: Image.asset(
                              imagePath, // default local asset (placeholder)
                              fit: BoxFit.cover,
                              width: w * .14,
                              height: w * .14,
                            ),
                          ),
                          //       : null,
                          // );
                          //      }),

                          //new
                          // Obx(
                          //   () => CircleAvatar(
                          //     radius: w * .07,
                          //     backgroundColor: Colors.grey.shade300,
                          //     backgroundImage:
                          //         authController
                          //             .profileImageUrl
                          //             .value
                          //             .isNotEmpty
                          //         ? NetworkImage(
                          //             authController.profileImageUrl.value
                          //                 .toString(),
                          //           )
                          //         : null,
                          //     child:
                          //         authController.profileImageUrl.value.isEmpty
                          //         ? ClipOval(
                          //             child: Image.asset(
                          //               imagePath, // default asset
                          //               fit: BoxFit.cover,
                          //               width: w * .14,
                          //               height: w * .14,
                          //             ),
                          //           )
                          //         : null,
                          //   ),
                          // ),
                          SizedBox(width: w * .02),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Obx(
                              //   () =>
                              AppFonts.textPoppins(
                                context,
                                // authController.userName.value == ""
                                //     ? "User"
                                //     : authController.userName.value,
                                "User Name",
                                w * .065,
                                FontWeight.w500,
                                AppColors.black,
                                TextAlign.start,
                                TextOverflow.ellipsis,
                              ),
                              //   ),
                              AppFonts.textPoppins(
                                context,
                                // authController.phoneNumber.value == ""
                                //     ? "+91 ${1234567890}"
                                //     : "+91 ${authController.phoneNumber.value}",
                                "1234567890",
                                w * .04,
                                FontWeight.w400,
                                AppColors.mediumGray,
                                TextAlign.start,
                                TextOverflow.ellipsis,
                              ),
                              SizedBox(height: w * .01),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppColors.lightGray),
                    GestureDetector(
                      onTap: () {
                        // CustomNavigation.push(context, EditProfile());
                        CustomNavigator.push(
                          context,
                          EditProfileScreen(),
                          transition: TransitionType.slideLeft,
                        );
                      },
                      child: customMenuItemsButton(
                        "assets/icons/profileEdit.png",
                        "Edit",
                      ),
                    ),
                    SizedBox(height: w * .02),
                  ],
                ),
              ),
              // ),
              //?first list of profile menu buttons
              SizedBox(height: w * .02),
              Card(
                elevation: 1,
                color: AppColors.white,
                child: Column(
                  children: List.generate(4, (index) {
                    return Column(
                      children: [
                        index == 0
                            ? SizedBox(height: w * .02)
                            : SizedBox.shrink(),
                        GestureDetector(
                          onTap: () {
                            CustomNavigator.push(
                              context,
                              firstScreens[index],
                              transition: TransitionType.slideLeft,
                            );
                            //     CustomNavigation.push(context, firstScreens[index]);
                          },
                          child: customMenuItemsButton(
                            firstImagePathList[index],
                            firstTitleList[index],

                            //? navigate screen=======================
                          ),
                        ),
                        index < 3
                            ? Divider(
                                indent: w * .13,
                                color: AppColors.lightGray,
                              )
                            : SizedBox.shrink(),
                        index == 3
                            ? SizedBox(height: w * .02)
                            : SizedBox.shrink(),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: w * .02),
              //?second list of profile menu buttons
              Card(
                elevation: 1,
                color: AppColors.white,
                child: Column(
                  children: List.generate(3, (index) {
                    return Column(
                      children: [
                        index == 0
                            ? SizedBox(height: w * .02)
                            : SizedBox.shrink(),
                        GestureDetector(
                          onTap: () {
                            // CustomNavigation.push(
                            //   context,
                            //   secondScreens[index],
                            // );
                          },
                          child: customMenuItemsButton(
                            secondImagePathList[index],
                            secondTitleList[index],
                          ),
                        ),
                        index < 2
                            ? Divider(
                                indent: w * .13,
                                color: AppColors.lightGray,
                              )
                            : SizedBox.shrink(),
                        index == 2
                            ? SizedBox(height: w * .02)
                            : SizedBox.shrink(),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: w * .02),
              GestureDetector(
                onTap: () {
                  //   PopupScreen().logout(context);
                },
                child: Card(
                  elevation: 1,
                  color: AppColors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * .04,
                      vertical: w * .04,
                    ),
                    child: Row(
                      children: [
                        //  Image on left
                        CustomImages.images(
                          "assets/icons/profileLogout.png",
                          w * .06,
                          w * .06,
                        ),
                        SizedBox(width: w * 0.02),

                        //Title
                        AppFonts.textPoppins(
                          context,
                          "Logout",
                          w * .04,
                          FontWeight.w500,
                          AppColors.primaryblue,
                          TextAlign.start,
                          TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: w * .03),
            ],
          ),
        ),
      ),
    );
  }

  Widget customMenuItemsButton(
    String imagePath,
    String title,
    //  Widget navigateScreen,
  ) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .04, vertical: w * .012),
        child: Row(
          children: [
            //  Image on left
            CustomImages.images(imagePath, w * .07, w * .07),
            SizedBox(width: w * 0.02),

            //Title
            AppFonts.textPoppins(
              context,
              title,
              w * .04,
              FontWeight.w400,
              AppColors.black,
              TextAlign.start,
              TextOverflow.ellipsis,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.mediumGray,
              size: w * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
