import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nzcu_user/utils/custom_images.dart';
import 'package:nzcu_user/utils/with_animations/app_buttons.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';

class Details {
  String imagePath = "assets/images/nzcuCar.png";
  //? about rider============================
  Widget riderDetails(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     SizedBox(height: w * .02),
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: Image.asset(
            imagePath, // default local asset (placeholder)
            fit: BoxFit.cover,
            width: w * .14,
            height: w * .14,
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
                w * .05,
                FontWeight.w600,
                AppColors.black,
                TextAlign.center,
                TextOverflow.ellipsis,
              ),

              AppFonts.textPoppins(
                context,
                "Sep 28, 2025 • 6:45 PM",
                w * .03,
                FontWeight.w400,
                AppColors.mediumGray,
                TextAlign.center,
                TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        AppButtons.solid(
          context: context,
          text: "Repeat",
          onClicked: () {},
          fontSize: w * .03,
          width: w * .25,
          height: w * .08,
        ),
      ],
    );
    //   ],
    // );
  }

  //? details about locations and also cost.....
  Widget rideLocations(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        //? pickUp location history
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImages.images("assets/icons/greenDot.png", w * .07, w * .07),
            SizedBox(width: w * .02),
            Expanded(
              child: AppFonts.textPoppins(
                context,
                "Bus Sta Upas, Majestic, Bengaluru, Karnataka 560009",
                w * .035,
                FontWeight.w400,
                AppColors.mediumGray,
                TextAlign.center,
                TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Divider(),
        //? drop location history
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImages.images("assets/icons/redDot.png", w * .07, w * .07),
            SizedBox(width: w * .02),
            Expanded(
              child: AppFonts.textPoppins(
                context,
                "Bus Sta Upas, Majestic, Bengaluru, Karnataka 560009",
                w * .035,
                FontWeight.w400,
                AppColors.mediumGray,
                TextAlign.center,
                TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  //? ride history=> cost---distance ---time
  Widget rideCostDetails(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    List cardDetailsIconList = [
      "assets/icons/costofride.png",
      "assets/icons/costofride.png",
      "assets/icons/costofride.png",
    ];
    List detailsList = ["₹85", "15.36km", "05:03 Pm"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) {
        return Row(
          children: [
            CustomImages.images(
              cardDetailsIconList[index],
              //  "assets/icons/totalCost.png",
              w * .045,
              w * .045,
            ),
            SizedBox(width: w * .02),
            AppFonts.textPoppins(
              context,
              detailsList[index],
              w * .035,
              FontWeight.w600,
              AppColors.mediumGray,
              TextAlign.center,
              TextOverflow.ellipsis,
            ),
          ],
        );
      }),
    );
  }

  Widget invoice(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    List changesName = ["Ride Charge", "Booking Fees ", "Discount"];
    List chargesAmount = ["15.36", "42.00", "-29.00"];
    return Column(
      children: [
        SizedBox(height: w * .03),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .04, vertical: w * .01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppFonts.textPoppins(
                context,
                "Total fare",
                w * .04,
                FontWeight.w600,
                AppColors.black,
                TextAlign.center,
                TextOverflow.ellipsis,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.currency_rupee,
                    size: w * .04,
                    color: AppColors.black,
                  ),
                  AppFonts.textPoppins(
                    context,
                    "74.00",
                    w * .04,
                    FontWeight.w600,
                    AppColors.black,
                    TextAlign.center,
                    TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .04, vertical: w * .01),
          child: Column(
            children: List.generate(3, (index) {
              String amount = chargesAmount[index];
              bool isNegative = amount.startsWith("-");

              return Padding(
                padding: EdgeInsets.symmetric(vertical: w * .005),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppFonts.textPoppins(
                      context,
                      changesName[index],
                      w * .035,
                      FontWeight.w600,
                      AppColors.black,
                      TextAlign.center,
                      TextOverflow.ellipsis,
                    ),

                    Row(
                      children: [
                        if (isNegative)
                          AppFonts.textPoppins(
                            context,
                            "-",
                            w * .035,
                            FontWeight.w600,
                            AppColors.black,
                            TextAlign.center,
                            TextOverflow.ellipsis,
                          ),

                        Icon(
                          Icons.currency_rupee,
                          size: w * .036,
                          color: AppColors.black,
                        ),
                        AppFonts.textPoppins(
                          context,
                          isNegative ? amount.substring(1) : amount,
                          w * .035,
                          FontWeight.w600,
                          AppColors.black,
                          TextAlign.center,
                          TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppFonts.textPoppins(
                context,
                "Send Email",
                w * .035,
                FontWeight.w500,
                AppColors.blue,
                TextAlign.center,
                TextOverflow.ellipsis,
              ),

              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.blue,
                size: w * .035,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
