import 'package:flutter/material.dart';
import 'package:nzcu_user/demo_screen.dart';
import 'package:nzcu_user/rides_s_related/details.dart';
import 'package:nzcu_user/rides_s_related/ride_in_detail.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';
import 'package:nzcu_user/utils/with_animations/navigator.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  List cardDetailsIconList = [
    "assets/icons/totalCost.png",
    "assets/icons/routing.png",
    "assets/icons/clockIcon.png",
  ];
  List detailsList = ["₹85", "15.36km", "05:03 Pm"];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .04),
          child: AppFonts.textPoppins(
            context,
            "My Rides",
            w * .05,
            FontWeight.w600,
            AppColors.black,
            TextAlign.center,
            TextOverflow.ellipsis,
          ),
        ),
      ),
      body:
          //? no rides==========================
          //Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.symmetric(horizontal: w * .04),
          //         child: CustomImages.images(
          //           "assets/images/noRides.png",
          //           w * 1.0,
          //           w * .5,
          //         ),
          //       ),
          //       SizedBox(height: w * .03),
          //       CustomText(
          //         text: " No rides yet!",
          //         textColor: ColorsList.titleTextColor,
          //         textFontSize: w * .055,
          //         textFontWeight: FontWeight.w500,
          //       ),
          //       SizedBox(height: w * .01),
          //       CustomText(
          //         text: "Book now and enjoy the road ahead.",
          //         textColor: ColorsList.subtitleTextColor,
          //         textFontSize: w * .04,
          //         textFontWeight: FontWeight.w400,
          //       ),
          //     ],
          //   ),
          // ),
          //?======================rides history====context
          ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .04,
                  vertical: w * .02,
                ),
                child: GestureDetector(
                  onTap: () {
                    //? navigate to details about ride===========================
                    //  CustomNavigation.push(context, RideDetails());
                    CustomNavigator.push(
                      context,
                      RideInDetail(),
                      transition: TransitionType.slideBottom,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w * .02),
                      border: Border.all(color: AppColors.primaryblue),
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * .04,
                        vertical: w * .02,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //? details about ride======================
                          Details().riderDetails(context),
                          SizedBox(height: w * .03),
                          Details().rideLocations(context),
                          SizedBox(height: w * .04),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }
}
