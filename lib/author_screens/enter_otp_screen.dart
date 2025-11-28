import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nzcu_user/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:nzcu_user/utils/custom_otp_box.dart';
import 'package:nzcu_user/utils/with_animations/app_buttons.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';
import 'package:nzcu_user/utils/with_animations/navigator.dart';

class EnterOtpScreen extends StatefulWidget {
  const EnterOtpScreen({super.key});

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  String enteredOtp = "";
  // Auth authCotroller = Get.find<Auth>();
  // Controllers contentController = Get.find<Controllers>();
  // final OtpController otpController = Get.put(OtpController(), permanent: true);
  @override
  void initState() {
    super.initState();
    // contentController.maxheightReach.value = false;
    // authCotroller.otpVerify.value = false;
    // otpController.ensureTimerRunning();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //  otpController.ensureTimerRunning();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: w * .12),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, size: w * .08),
            ),
            SizedBox(height: w * .02),
            AppFonts.textPoppins(
                  context,
                  "Verify Phone Number",
                  w * .06,
                  FontWeight.w600,
                  AppColors.black,
                  TextAlign.start,
                  TextOverflow.ellipsis,
                )
                .animate()
                .fade(duration: 1000.ms, curve: Curves.easeInOut)
                .scale(
                  begin: const Offset(0.95, 0.95),
                  end: const Offset(1, 1),
                ),

            AppFonts.textPoppins(
              context,
              "Please enter the 4 digit code sent to +91 8238658110 through SMS",
              w * .042,
              FontWeight.w400,
              AppColors.black,
              TextAlign.start,
              TextOverflow.visible,
              maxLines: 2,
            ),
            SizedBox(height: w * .02),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * .08,
                vertical: w * .02,
              ),
              child: CustomOtpBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFonts.textPoppins(
                  context,
                  "Haven't got the confirmation code yet?",
                  w * 0.032,
                  FontWeight.w500,
                  AppColors.mediumGray,
                  TextAlign.center,
                  TextOverflow.ellipsis,
                ),
                SizedBox(width: w * .01),
                AppFonts.textPoppins(
                  context,
                  "00:59",
                  w * 0.032,
                  FontWeight.w500,
                  AppColors.mediumGray,
                  TextAlign.center,
                  TextOverflow.ellipsis,
                ),
              ],
            ),
            Spacer(),
            AppButtons.solid(
                  context: context,
                  width: w,
                  //    isLoading: authCotroller.loading.value,
                  text: "Verify",
                  onClicked: () {
                    CustomNavigator.push(
                      context,
                      CustomBottomNavBar(),
                      transition: TransitionType.fade,
                    );
                  },
                  textColor: AppColors.black,
                )
                .animate()
                .fade(duration: 1000.ms, curve: Curves.easeInOut)
                .scale(
                  begin: const Offset(0.95, 0.95),
                  end: const Offset(1, 1),
                ),

            SizedBox(height: w * .1),
          ],
        ),
      ),
    );
  }
}
