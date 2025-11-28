import 'package:flutter/material.dart';
import 'package:nzcu_user/utils/custom_images.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';
import 'package:nzcu_user/utils/with_animations/navigator.dart';

class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({super.key});

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> {
  List referStep = [
    "Invite your friend to install the app with this referal code.",
    "Your friend must completes at least 1 ride within 7 days of registration.",
    "You will get ₹50 when your friend fulfills this criteria.",
  ];
  List imagePath = [
    "assets/icons/editIcon.png",
    "assets/icons/editIcon.png",
    "assets/icons/editIcon.png",
  ];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        titleSpacing: w * .035,
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
              "Refer & Earn",
              w * .05,
              FontWeight.w500,
              AppColors.black,
              TextAlign.start,
              TextOverflow.visible,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 0,
                color: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * .02,
                    vertical: w * .02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImages.images(
                        "assets/images/refer1.png",
                        w * .34,
                        w * .4,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: w * .45,
                            // height: w * .3,
                            //  color: Colors.amber,
                            child: AppFonts.textPoppins(
                              context,
                              "Earn upto ₹50 per friend you invite to Indrive  ",
                              w * .042,
                              FontWeight.w500,
                              AppColors.black,
                              TextAlign.start,
                              TextOverflow.visible,
                            ),
                          ),
                          SizedBox(height: w * .02),
                          // Buttons(
                          //   buttonColor: ColorsList.coupanButtonBackgroundColor,
                          //   buttonWidth: w * .27,
                          //   buttonHeight: w * .1,
                          //   onTap: () {},
                          //   buttonText: CustomText(
                          //     text: "CFMYAGO",
                          //     textColor: ColorsList.titleTextColor,
                          //     textFontSize: w * .035,
                          //     textFontWeight: FontWeight.w500,
                          //     textalign: TextAlign.end,
                          //   ),
                          //   imageAfterText: CustomImages.images(
                          //     "assets/icons/coupanIcon.png",
                          //     w * .04,
                          //     w * .04,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .015,
                  vertical: w * .04,
                ),
                child: CustomImages.customCard(
                  context: context,
                  blurRadius: 1,
                  containerWidth: double.infinity,
                  containerHeight: w * .1,
                  widget1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // CustomImages.images(
                        //   "assets/icons/inviteIcon.png",
                        //   w * .05,
                        //   w * .05,
                        // ),
                        SizedBox(width: w * .02),
                        AppFonts.textPoppins(
                          context,
                          "Invite Friends",
                          w * .037,
                          FontWeight.w500,
                          AppColors.black,
                          TextAlign.start,
                          TextOverflow.visible,
                        ),

                        Spacer(),
                        // Buttons(
                        //   buttonWidth: w * .16,
                        //   buttonHeight: w * .06,
                        //   borderRadius: 20,
                        //   borderColor: ColorsList.mainAppColor,
                        //   buttonColor: ColorsList.scaffoldColor,
                        //   onTap: () {},
                        //   buttonText: CustomText(
                        //     text: "Link",
                        //     textColor: ColorsList.mainAppColor,
                        //     textFontSize: w * .03,
                        //     textFontWeight: FontWeight.w500,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppFonts.textPoppins(
                      context,
                      "How it works?",
                      w * .035,
                      FontWeight.w500,
                      AppColors.black,
                      TextAlign.start,
                      TextOverflow.visible,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: w * .03),
                      child: CustomImages.customCard(
                        context: context,
                        blurRadius: 1,
                        containerWidth: double.infinity,
                        containerHeight: w * .46,
                        widget1: Padding(
                          padding: EdgeInsets.symmetric(vertical: w * .03),
                          child: Column(
                            children: List.generate(3, (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: w * .03,
                                  vertical: w * .02,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: w * .037,
                                      backgroundColor: Color.fromRGBO(
                                        242,
                                        242,
                                        242,
                                        1,
                                      ),
                                      //  child:
                                      //  CustomImages.images(
                                      //   imagePath[index],
                                      //   w * .045,
                                      //   w * .045,
                                      // ),
                                    ),
                                    SizedBox(width: w * .055),
                                    SizedBox(
                                      width: w * .7,
                                      // color: Colors.amber,
                                      child: AppFonts.textPoppins(
                                        context,
                                        referStep[index],
                                        w * .032,
                                        FontWeight.w400,
                                        AppColors.black,
                                        TextAlign.start,
                                        TextOverflow.visible,
                                        maxLines: 2,
                                      ),
                                    ),
                                    //  SizedBox(width: w * .02),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .015,
                  vertical: w * .02,
                ),
                child: CustomImages.customCard(
                  context: context,
                  blurRadius: 1,
                  containerWidth: double.infinity,
                  containerHeight: w * .1,
                  widget1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // CustomImages.images(
                        //   "assets/icons/totalEarnIcon.png",
                        //   w * .05,
                        //   w * .05,
                        // ),
                        SizedBox(width: w * .02),
                        AppFonts.textPoppins(
                          context,
                          "Total Earn",
                          w * .04,
                          FontWeight.w500,
                          AppColors.black,
                          TextAlign.start,
                          TextOverflow.visible,
                        ),

                        Spacer(),
                        AppFonts.textPoppins(
                          context,
                          "₹100",
                          w * .04,
                          FontWeight.w500,
                          AppColors.black,
                          TextAlign.start,
                          TextOverflow.visible,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: w * .3),
              // Buttons(
              //   onTap: () {},
              //   buttonText: CustomText(
              //     text: "Refer Now",
              //     textColor: ColorsList.mainButtonTextColor,
              //     textFontSize: w * .045,
              //     textFontWeight: FontWeight.w500,
              //   ),
              // ),
              SizedBox(height: w * .1),
            ],
          ),
        ),
      ),
    );
  }
}
