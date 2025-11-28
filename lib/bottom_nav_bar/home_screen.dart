import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nzcu_user/utils/ads.dart';
import 'package:nzcu_user/utils/custom_images.dart';
import 'package:nzcu_user/utils/googlemap/google_map_widget.dart';
import 'package:nzcu_user/utils/with_animations/app_buttons.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';
import 'package:nzcu_user/utils/with_animations/form_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController currentLocationController = TextEditingController();
  List<String> cabImages = [
    "assets/images/mainbike.png",
    "assets/images/auto.png",
    "assets/images/car.png",
    "assets/images/truck.png",
  ];
  List<String> cabName = ["Bike", "Auto", "Cab", "Truck"];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Top section: search bar + map
            Column(
              children: [
                Container(
                  color: AppColors.white,
                  padding: EdgeInsets.symmetric(horizontal: w * .03),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: w * .03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImages.images(
                                      "assets/images/splash3.png",
                                      w * .1,
                                      w * .1,
                                    )
                                    .animate()
                                    .fade(
                                      duration: 1000.ms,
                                      curve: Curves.easeInOut,
                                    )
                                    .scale(
                                      begin: const Offset(0.95, 0.95),
                                      end: const Offset(1, 1),
                                    ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w * .02,
                                  ),
                                  child: AppFonts.textPoppins(
                                    context,
                                    "Nzcu",
                                    w * .056,
                                    FontWeight.w600,
                                    AppColors.black,
                                    TextAlign.start,
                                    TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.notifications,
                              color: AppColors.black,
                              size: w * .07,
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: AppFormFields.custTextFormOther(
                          context: context,
                          hintText: "Your ride starts here – where to?...",
                          controller: currentLocationController,
                          // borderRadius: 20,
                          borderColor: Colors.transparent,
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.02),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.black,
                            size: w * .07,
                          ),
                        ),
                      ),
                      SizedBox(height: w * .02),
                    ],
                  ),
                ),
                Expanded(
                  child: GoogleMapWidget(
                    initialPosition: LatLng(23.2599, 77.4126),
                  ),
                ),
              ],
            ),
            //? Draggable bottom sheet (white container with content)
            DraggableScrollableSheet(
              initialChildSize: 0.35, // initial visible part
              minChildSize: 0.35,
              maxChildSize: 0.83, // can expand almost full screen
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.vertical(
                    //   top: Radius.circular(w * 0.06),
                    // ),
                    //  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * .02,
                        vertical: w * .04,
                      ),
                      child: _buildInnerContent(w),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInnerContent(double w) {
    // Keep your current inner content exactly as it is
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // AppFonts.textPoppins(
        //   context,
        //   "Booking Status",
        //   w * .04,
        //   FontWeight.w600,
        //   AppColors.black,
        //   TextAlign.start,
        //   TextOverflow.visible,
        // ),
        // SizedBox(height: w * .03),
        // GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(w * .02),
        //       border: Border.all(color: AppColors.mediumGray),
        //     ),
        //     child: Column(
        //       children: [
        //         // Padding(
        //         //   padding: EdgeInsets.symmetric(
        //         //     horizontal: w * .04,
        //         //     vertical: w * .02,
        //         //   ),
        //         //   child:
        //         //       Column(
        //         //             crossAxisAlignment: CrossAxisAlignment.start,
        //         //             children: [
        //         //               SizedBox(height: w * .03),
        //         //               Details().rideLocations(context),
        //         //               SizedBox(height: w * .04),
        //         //               Details().rideCostDetails(context),
        //         //             ],
        //         //           )
        //         //           .animate()
        //         //           .fade(duration: 1000.ms, curve: Curves.easeInOut)
        //         //           .scale(
        //         //             begin: const Offset(0.95, 0.95),
        //         //             end: const Offset(1, 1),
        //         //           ),
        //         // ),
        //         Container(
        //           width: double.infinity,
        //           height: w * .12,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.only(
        //               bottomLeft: Radius.circular(w * .02),
        //               bottomRight: Radius.circular(w * .02),
        //             ),
        //             border: Border(
        //               top: BorderSide(color: AppColors.mediumGray),
        //             ),
        //             color: AppColors.mediumGray,
        //           ),
        //           child: Center(
        //             child: AppFonts.textPoppins(
        //               context,
        //               "Paid • ₹1529",
        //               w * .04,
        //               FontWeight.w500,
        //               AppColors.green,
        //               TextAlign.center,
        //               TextOverflow.visible,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // SizedBox(height: w * .03),
        AppFonts.textPoppins(
          context,
          "Explore",
          w * .04,
          FontWeight.w600,
          AppColors.black,
          TextAlign.start,
          TextOverflow.visible,
        ),
        SizedBox(height: w * .03),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(cabImages.elementAt(index), width: w * .2),
                    SizedBox(height: w * .02),
                    AppFonts.textPoppins(
                      context,
                      cabName.elementAt(index),
                      w * .035,
                      FontWeight.w500,
                      AppColors.black,
                      TextAlign.center,
                      TextOverflow.visible,
                    ),
                  ],
                )
                .animate()
                .fade(duration: 1000.ms, curve: Curves.easeInOut)
                .scale(
                  begin: const Offset(0.95, 0.95),
                  end: const Offset(1, 1),
                );
          }),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: w * .05),
          child: Ads(
            widget: CustomImages.images(
              "assets/images/adsImage.png",
              double.infinity,
              w * .3,
            ),
          ),
        ),

        AppFonts.textPoppins(
          context,
          "Make your next journey simple",
          w * .04,
          FontWeight.w600,
          AppColors.black,
          TextAlign.start,
          TextOverflow.visible,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: w * .04),
          child: CustomImages.customCard(
            containerWidth: double.infinity,
            containerHeight: w * .32,
            context: context,
            widget1: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * .02,
                //  vertical: w * .02,
              ),
              child:
                  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImages.images(
                            "assets/images/splash2.png",
                            w * .28,
                            w * .28,
                          ),
                          SizedBox(width: w * .02),
                          SizedBox(
                            width: w * .6,
                            //  color: Colors.red,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: w * .02),
                                AppFonts.textPoppins(
                                  context,
                                  "Rental car",
                                  w * .042,
                                  FontWeight.w600,
                                  AppColors.black,
                                  TextAlign.start,
                                  TextOverflow.visible,
                                ),

                                SizedBox(height: w * .01),
                                AppFonts.textPoppins(
                                  context,
                                  "Choose rental options from 1 hour up to 12 hours.",
                                  w * .032,
                                  FontWeight.w400,
                                  AppColors.mediumGray,
                                  TextAlign.start,
                                  TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                SizedBox(height: w * .02),
                                AppButtons.solid(
                                      context: context,
                                      width: w * .6,
                                      height: w * .09,
                                      text: "Rent now",
                                      onClicked: () {
                                        // CustomNavigator.push(
                                        //   context,
                                        //   RentalScreen(),
                                        // );
                                      },
                                      textColor: AppColors.black,
                                      backgroundColor: AppColors.primaryblue,
                                      fontSize: w * .03,
                                    )
                                    .animate()
                                    .fade(
                                      duration: 1000.ms,
                                      curve: Curves.easeInOut,
                                    )
                                    .scale(
                                      begin: const Offset(0.95, 0.95),
                                      end: const Offset(1, 1),
                                    ),

                                SizedBox(height: w * .01),
                              ],
                            ),
                          ),
                        ],
                      )
                      .animate()
                      .fade(duration: 1000.ms, curve: Curves.easeInOut)
                      .scale(
                        begin: const Offset(0.95, 0.95),
                        end: const Offset(1, 1),
                      ),
            ),
          ),
        ),
        SizedBox(height: w * .05),
        Stack(
          children: [
            CustomImages.images("assets/images/nzcuLogo.png", w, w * .4),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .05),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomImages.images(
                      "assets/images/NzcuName.png",
                      w * .15,
                      w * .2,
                    ),
                    CustomImages.images(
                      "assets/images/nzcuCar.png",
                      w * .25,
                      w * .2,
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
}
