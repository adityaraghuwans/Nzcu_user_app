import 'package:flutter/material.dart';
import 'package:nzcu_user/utils/custom_images.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';
import 'package:nzcu_user/utils/with_animations/navigator.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
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
              "Safety",
              w * .055,
              FontWeight.w500,
              AppColors.black,
              TextAlign.start,
              TextOverflow.visible,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppFonts.textPoppins(
              context,
              "Your safety come first.",
              w * .045,
              FontWeight.w500,
              AppColors.black,
              TextAlign.start,
              TextOverflow.visible,
            ),

            AppFonts.textPoppins(
              context,
              "Every trip is protected with safety checks and alerts.",
              w * .038,
              FontWeight.w400,
              AppColors.mediumGray,
              TextAlign.start,
              TextOverflow.visible,
              maxLines: 2,
            ),
            CustomImages.images("assets/images/safety11.png", w * 1.0, w * 1.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGray),
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .03,
                  vertical: w * .03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImages.images(
                      "assets/icons/safetyIcon1.png",
                      w * .05,
                      w * .05,
                    ),
                    SizedBox(width: w * .02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppFonts.textPoppins(
                          context,
                          "Manage Trusted Contacts",
                          w * .04,
                          FontWeight.w500,
                          AppColors.black,
                          TextAlign.start,
                          TextOverflow.visible,
                        ),
                        AppFonts.textPoppins(
                          context,
                          "Add your contact number to stay connected.",
                          w * .03,
                          FontWeight.w500,
                          AppColors.mediumGray,
                          TextAlign.start,
                          TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.mediumGray,
                      size: w * 0.03,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: w * .05),
            //support
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGray),
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .03,
                  vertical: w * .03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImages.images(
                      "assets/icons/safetyIcon2.png",
                      w * .05,
                      w * .05,
                    ),
                    SizedBox(width: w * .02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppFonts.textPoppins(
                          context,
                          "24/7 Support",
                          w * .04,
                          FontWeight.w500,
                          AppColors.black,
                          TextAlign.start,
                          TextOverflow.visible,
                        ),
                        AppFonts.textPoppins(
                          context,
                          "Set up contacts for one- tap ride sharing.",
                          w * .03,
                          FontWeight.w500,
                          AppColors.mediumGray,
                          TextAlign.start,
                          TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.mediumGray,
                      size: w * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
