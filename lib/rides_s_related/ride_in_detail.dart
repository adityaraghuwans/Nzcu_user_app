import 'package:flutter/material.dart';
import 'package:nzcu_user/rides_s_related/details.dart';
import 'package:nzcu_user/utils/custom_images.dart';
import 'package:nzcu_user/utils/with_animations/app_buttons.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';

class RideInDetail extends StatefulWidget {
  const RideInDetail({super.key});

  @override
  State<RideInDetail> createState() => _RideInDetailState();
}

class _RideInDetailState extends State<RideInDetail> {
  String imagePath = "assets/images/nzcuCar.png";

  Widget riderFullDetails(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: w * .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.asset(
                imagePath, // default local asset (placeholder)
                fit: BoxFit.cover,
                width: w * .12,
                height: w * .12,
              ),
            ),
            SizedBox(width: w * .03),
            SizedBox(
              width: w * .35,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppFonts.textPoppins(
                    context,
                    "Muskan",
                    w * .04,
                    FontWeight.w400,
                    AppColors.black,
                    TextAlign.start,
                    TextOverflow.visible,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                        size: w * .04,
                      ),
                      AppFonts.textPoppins(
                        context,
                        "4.5",
                        w * .03,
                        FontWeight.w400,
                        AppColors.black,
                        TextAlign.start,
                        TextOverflow.visible,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: w * .05),
            SizedBox(
              width: w * .28,
              //color: Colors.red,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .005,
                  vertical: w * .005,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month, size: w * .05),
                        SizedBox(width: w * .02),
                        AppFonts.textPoppins(
                          context,
                          "12/09/2025",
                          w * .035,
                          FontWeight.w400,
                          AppColors.black,
                          TextAlign.start,
                          TextOverflow.visible,
                        ),
                      ],
                    ),
                    SizedBox(height: w * .01),
                    Row(
                      children: [
                        Icon(Icons.directions_bike, size: w * .05),

                        SizedBox(width: w * .02),
                        AppFonts.textPoppins(
                          context,
                          "Round Trip",
                          w * .035,
                          FontWeight.w400,
                          AppColors.black,
                          TextAlign.start,
                          TextOverflow.visible,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
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
                //  CustomNavigation.pop(context);
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
              "Details",
              w * .05,
              FontWeight.w500,
              AppColors.black,
              TextAlign.start,
              TextOverflow.visible,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .03, vertical: w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImages.customCard(
              context: context,
              containerWidth: double.infinity,
              blurRadius: 3,
              widget1: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .04,
                  vertical: w * .02,
                ),
                child: riderFullDetails(context),
              ),
            ),
            SizedBox(height: w * .03),
            AppFonts.textPoppins(
              context,
              "Ride Details",
              w * .038,
              FontWeight.w600,
              AppColors.black,
              TextAlign.center,
              TextOverflow.ellipsis,
            ),

            SizedBox(height: w * .02),
            CustomImages.customCard(
              containerHeight: w * .39,
              context: context,
              containerWidth: double.infinity,
              blurRadius: 2,
              widget1: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .02,
                  vertical: w * .02,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * .04,
                        vertical: w * .01,
                      ),
                      child: Details().rideLocations(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: w * .01),
                      child: Divider(color: AppColors.mediumGray),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * .04,
                        vertical: w * .01,
                      ),
                      child: Details().rideCostDetails(context),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: w * .03),
            AppFonts.textPoppins(
              context,
              "Invoice",
              w * .038,
              FontWeight.w600,
              AppColors.black,
              TextAlign.center,
              TextOverflow.ellipsis,
            ),

            SizedBox(height: w * .02),
            CustomImages.customCard(
              context: context,
              containerHeight: w * .45,
              containerWidth: double.infinity,
              widget1: Details().invoice(context),
            ),
            SizedBox(height: w * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox.shrink(),
                AppButtons.outlined(
                  context: context,
                  text: "Download",
                  onClicked: () {},
                  textColor: AppColors.blue,
                  borderColor: AppColors.blue,
                  radius: w * .20,
                  width: w * .25,
                  height: w * .06,
                  fontSize: w * .022,
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Spacer(),
            // Buttons(
            //   buttonWidth: w * .24,
            //   buttonHeight: w * .07,
            //   borderRadius: w * .05,
            //   buttonColor: ColorsList.scaffoldColor,
            //   borderColor: ColorsList.linksTextColor,
            //   onTap: () {},
            //   buttonText: Padding(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: w * .005,
            //       vertical: w * .01,
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         CustomText(
            //           text: "Download",
            //           textColor: ColorsList.linksTextColor,
            //           textFontSize: w * .03,
            //           textFontWeight: FontWeight.w500,
            //         ),
            //         SizedBox(width: w * .01),
            //         Icon(
            //           Icons.file_download_outlined,
            //           size: w * .04,
            //           color: ColorsList.linksTextColor,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
