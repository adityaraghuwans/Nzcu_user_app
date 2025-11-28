import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'package:nzcu_user/author_screens/enter_otp_screen.dart';
import 'package:nzcu_user/author_screens/signup_details_screen.dart';
import 'package:nzcu_user/controller/check_box_controller.dart';
import 'package:nzcu_user/utils/with_animations/app_buttons.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';
import 'package:nzcu_user/utils/with_animations/form_field.dart';
import 'package:nzcu_user/utils/with_animations/navigator.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  // Auth authController = Get.put(Auth());
  // Controllers checkBoxController = Get.put(Controllers());
  final checkBoxController = Get.put(CheckBoxController());

  TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkBoxController.checkBox.value = false;
    // numberController.addListener(() {
    //   setState(() {});
    //  });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      //   backgroundColor: ColorsList.scaffoldColor,
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: w * .15),
                      Image.asset("assets/images/login1.png", width: w)
                          .animate()
                          .fade(duration: 1000.ms, curve: Curves.easeInOut)
                          .scale(
                            begin: const Offset(0.95, 0.95),
                            end: const Offset(1, 1),
                          ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * .03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppFonts.textPoppins(
                                  context,
                                  "Join Nzcu Today",
                                  w * .058,
                                  FontWeight.w600,
                                  AppColors.black,
                                  TextAlign.start,
                                  TextOverflow.ellipsis,
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
                            AppFonts.textPoppins(
                                  context,
                                  "Let’s get stared! Enter your phone number to create your Nzcu account.",
                                  w * .04,
                                  FontWeight.w400,
                                  AppColors.mediumGray,
                                  TextAlign.start,
                                  TextOverflow.ellipsis,
                                  maxLines: 2,
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
                            SizedBox(height: w * .03),
                            AppFonts.textPoppins(
                              context,
                              "Phone Number",
                              w * .039,
                              FontWeight.w500,
                              AppColors.black,
                              TextAlign.start,
                              TextOverflow.ellipsis,
                            ),
                            SizedBox(height: w * .01),

                            Form(
                              key: _formKey,
                              child: AppFormFields.custTextFormOther(
                                context: context,
                                hintText: "Enter here",
                                controller: numberController,
                                keyboardType: TextInputType.numberWithOptions(),
                                maxLength: 10,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  } else if (value.length < 10) {
                                    return 'Phone number must be 10 digits';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            SizedBox(height: w * .02),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      checkBoxController.checkBoxUpdate();
                                    },
                                    child: Container(
                                      width: w * .04,
                                      height: w * .04,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          w * .01,
                                        ),
                                        border: Border.all(
                                          color: AppColors.primaryblue,
                                          width: w * .005,
                                        ),
                                        color: checkBoxController.checkBox.value
                                            ? AppColors.primaryblue
                                            : Colors.white,
                                      ),
                                      child: checkBoxController.checkBox.value
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: w * .03,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),

                                  SizedBox(width: w * .01),

                                  AppFonts.textPoppins(
                                    context,
                                    "I agree to Nzcu",
                                    w * .039,
                                    FontWeight.w400,
                                    AppColors.black,
                                    TextAlign.start,
                                    TextOverflow.ellipsis,
                                  ),

                                  SizedBox(width: w * .01),

                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        // CustomNavigation.push(context, TermsCondition());
                                      },
                                      child: AppFonts.textPoppins(
                                        context,
                                        "Terms & Conditions.",
                                        w * .039,
                                        FontWeight.w500,
                                        AppColors.blue,
                                        TextAlign.start,
                                        TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: w * .08),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppFonts.textPoppins(
                                    context,
                                    "Don't have an account?",
                                    w * .04,
                                    FontWeight.w400,
                                    AppColors.black,
                                    TextAlign.start,
                                    TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: w * .01),
                                  InkWell(
                                    onTap: () {
                                      CustomNavigator.push(
                                        context,
                                        SignupDetailsScreen(),
                                        transition: TransitionType.slideLeft,
                                      );
                                    },
                                    child: AppFonts.textPoppins(
                                      context,
                                      "Sign up",
                                      w * .04,
                                      FontWeight.w400,
                                      AppColors.blue,
                                      TextAlign.start,
                                      TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: w * .04),
                              child:
                                  AppButtons.solid(
                                        context: context,
                                        width: w,
                                        text: "Login",
                                        onClicked: () {
                                          CustomNavigator.push(
                                            context,
                                            EnterOtpScreen(),
                                            transition:
                                                TransitionType.slideLeft,
                                          );
                                        },
                                        textColor: AppColors.black,
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
                            ),
                          ],
                        ),
                      ),
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
