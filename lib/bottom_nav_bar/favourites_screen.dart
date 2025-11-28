import 'package:flutter/material.dart';
import 'package:nzcu_user/utils/with_animations/app_buttons.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  // AddressRelated addressRelatedController = Get.put(AddressRelated());
  String imagePath = "assets/images/nzcuCar.png";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // addressRelated();
  }

  void addressRelated() async {
    //  await addressRelatedController.getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppFonts.textPoppins(
              context,
              "Favourities",
              w * .05,
              FontWeight.w600,
              AppColors.black,
              TextAlign.center,
              TextOverflow.ellipsis,
            ),
            AppButtons.solid(
              context: context,
              text: "Add",
              onClicked: () {},
              prefixIcon: Icon(
                Icons.add,
                size: w * .05,
                color: AppColors.black,
              ),
              width: w * .2,
              height: w * .08,
              fontSize: w * .04,
              fontWeight: FontWeight.w500,
              textColor: AppColors.black,
              padding: EdgeInsets.only(right: w * .01),
            ),
          ],
        ),
      ),
      //? favourite locations list===============================
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * .03,
              vertical: w * .02,
            ),
            child: Container(
              width: double.infinity,
              //  height: w * .2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w * .02),

                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    spreadRadius: 0.5,
                    color: Colors.grey.shade200,
                  ),
                ],
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .035,
                  vertical: w * .03,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: w * .046,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: imagePath != null && imagePath.isNotEmpty
                          ? AssetImage(imagePath) //  NetworkImage(imageUrl)
                          : null,
                      child: (imagePath == null || imagePath.isEmpty)
                          ? Icon(
                              Icons.person,
                              size: w * .08,
                              color: Colors.grey.shade700,
                            )
                          : null,
                    ),
                    SizedBox(width: w * .02),
                    SizedBox(
                      width: w * .62,
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppFonts.textPoppins(
                            context,
                            "Home",
                            w * .04,
                            FontWeight.w500,
                            AppColors.black,
                            TextAlign.start,
                            TextOverflow.ellipsis,
                          ),
                          AppFonts.textPoppins(
                            context,
                            "Kalpana Nagar, Bhopal, Madhya Pradesh, 4620022.",
                            w * .028,
                            FontWeight.w500,
                            AppColors.mediumGray,
                            TextAlign.start,
                            TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),

                    Icon(Icons.edit, size: w * .04),
                    SizedBox(width: w * .03),
                    Icon(Icons.delete_rounded, size: w * .042),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
