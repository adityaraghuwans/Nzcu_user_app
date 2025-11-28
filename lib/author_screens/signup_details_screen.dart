import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:nzcu_user/utils/with_animations/app_buttons.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';
import 'package:nzcu_user/utils/with_animations/form_field.dart';

class SignupDetailsScreen extends StatefulWidget {
  const SignupDetailsScreen({super.key});

  @override
  State<SignupDetailsScreen> createState() => _SignupDetailsScreenState();
}

class _SignupDetailsScreenState extends State<SignupDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController referCodeController = TextEditingController();

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
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: w * .15),
                      Image.asset("assets/images/signup1.png", width: w),
                      SizedBox(height: w * .05),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * .03),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppFonts.textPoppins(
                                context,
                                "Join Indrive Today",
                                w * .056,
                                FontWeight.w600,
                                AppColors.black,
                                TextAlign.start,
                                TextOverflow.ellipsis,
                              ),
                              SizedBox(height: w * .01),
                              AppFonts.textPoppins(
                                context,
                                "Let's get stared! Enter your phone number to create your Nzcu account.",
                                w * .04,
                                FontWeight.w400,
                                AppColors.mediumGray,
                                TextAlign.start,
                                TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              SizedBox(height: w * .02),
                              AppFonts.textPoppins(
                                context,
                                "Name",
                                w * .039,
                                FontWeight.w400,
                                AppColors.black,
                                TextAlign.start,
                                TextOverflow.ellipsis,
                              ),

                              SizedBox(height: w * .01),
                              // AppFormFields.custTextFormOther(
                              //   context: context,
                              //   hintText: "Enter here",
                              //   controller: nameController,
                              //   keyboardType: TextInputType.text,
                              // ),
                              //new
                              AppFormFields.custTextFormOther(
                                context: context,
                                hintText: "Enter here",
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Name is required";
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: w * .02),
                              AppFonts.textPoppins(
                                context,
                                "Phone Number",
                                w * .039,
                                FontWeight.w400,
                                AppColors.black,
                                TextAlign.start,
                                TextOverflow.ellipsis,
                              ),

                              SizedBox(height: w * .01),
                              // AppFormFields.custTextFormOther(
                              //   context: context,
                              //   hintText: "Enter here",
                              //   controller: numberController,
                              //   keyboardType: TextInputType.numberWithOptions(),
                              //   maxLength: 10,
                              // ),
                              //new
                              AppFormFields.custTextFormOther(
                                context: context,
                                hintText: "Enter here",
                                controller: numberController,
                                keyboardType: TextInputType.numberWithOptions(),
                                maxLength: 10,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Phone number is required";
                                  } else if (value.trim().length != 10) {
                                    return "Enter a valid 10-digit number";
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: w * .02),
                              AppFonts.textPoppins(
                                context,
                                "Email",
                                w * .039,
                                FontWeight.w400,
                                AppColors.black,
                                TextAlign.start,
                                TextOverflow.ellipsis,
                              ),

                              SizedBox(height: w * .01),
                              // AppFormFields.custTextFormOther(
                              //   context: context,
                              //   hintText: "Enter here",
                              //   controller: emailController,
                              //   keyboardType: TextInputType.emailAddress,
                              //   // maxLength: 10,
                              // ),
                              //new
                              AppFormFields.custTextFormOther(
                                context: context,
                                hintText: "Enter here",
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Email is required";
                                  } else if (!value.contains("@")) {
                                    return "Enter a valid email";
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: w * .02),
                              AppFonts.textPoppins(
                                context,
                                "Referral Code",
                                w * .039,
                                FontWeight.w400,
                                AppColors.black,
                                TextAlign.start,
                                TextOverflow.ellipsis,
                              ),

                              SizedBox(height: w * .01),
                              AppFormFields.custTextFormOther(
                                context: context,
                                hintText: "Enter here",
                                controller: referCodeController,
                                keyboardType: TextInputType.visiblePassword,
                                maxLength: 10,
                              ),

                              SizedBox(height: w * .08),

                              AppButtons.solid(
                                    context: context,
                                    width: w,

                                    text: "Sign Up",

                                    onClicked: () {},
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

                              SizedBox(height: w * .08),
                            ],
                          ),
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
