// import 'package:flutter/material.dart';
// import 'package:indrive/colors/colors_list.dart';
// import 'package:indrive/screens/author_screens/enter_otp_screen.dart';
// import 'package:indrive/screens/author_screens/signup_details_screen.dart';
// import 'package:indrive/utilities/buttons.dart';
// import 'package:indrive/utilities/custom_text.dart';
// import 'package:indrive/utilities/with_animations/custom_font.dart';
// import 'package:indrive/utilities/custom_textfields/custom_textfield.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       //   backgroundColor: ColorsList.scaffoldColor,
//       resizeToAvoidBottomInset: true,
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraints.maxHeight),
//               child: IntrinsicHeight(
//                 child: Container(
//                   color: ColorsList.scaffoldColor,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         children: [
//                           SizedBox(
//                             height: w * 1.1,
//                             width: double.infinity,
//                             child: Image.asset("assets/images/loginImage.png"),
//                           ),
//                           Positioned(
//                             top: w * .23,
//                             right: 12,
//                             child: SizedBox(
//                               width: w * .6,
//                               height: w * .12,
//                               child: AppFonts.textPoppins(
//                                 context,
//                                 "Save time, save money and safe ride",
//                                 w * .04,
//                                 FontWeight.bold,
//                                 Colors.grey.shade400,
//                                 TextAlign.center,
//                                 TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: w * .03),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: w * .02),
//                             AppFonts.textPoppins(
//                               context,
//                               "Welcome Back!",
//                               w * .05,
//                               FontWeight.w600,
//                               ColorsList.titleTextColor,
//                               TextAlign.start,
//                               TextOverflow.ellipsis,
//                             ),
//                             SizedBox(height: w * .01),
//                             AppFonts.textPoppins(
//                               context,
//                               "Please enter your phone number to log in to your Indrive account.",
//                               w * .037,
//                               FontWeight.w400,
//                               ColorsList.subtitleTextColor,
//                               TextAlign.start,
//                               TextOverflow.ellipsis,
//                             ),
//                             SizedBox(height: w * .02),
//                             AppFonts.textPoppins(
//                               context,
//                               "Phone Number",
//                               w * .04,
//                               FontWeight.w400,
//                               ColorsList.titleTextColor,
//                               TextAlign.start,
//                               TextOverflow.ellipsis,
//                             ),
//                             SizedBox(height: w * .01),
//                             CustomTextfield(
//                               hintText: "Enter here",
//                               keyboardType: TextInputType.number,
//                             ),
//                             SizedBox(height: w * .02),
//                             Padding(
//                               padding: EdgeInsets.symmetric(vertical: w * .03),
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: Divider(
//                                       color: ColorsList.dividerColor,
//                                       thickness: 0.5,
//                                       endIndent: 10,
//                                     ),
//                                   ),
//                                   AppFonts.textPoppins(
//                                     context,
//                                     "Or",
//                                     w * .035,
//                                     FontWeight.w400,
//                                     ColorsList.titleTextColor,
//                                     TextAlign.center,
//                                     TextOverflow.ellipsis,
//                                   ),
//                                   Expanded(
//                                     child: Divider(
//                                       color: ColorsList.dividerColor,
//                                       thickness: 0.5,
//                                       indent: 10,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: w * .02,
//                                 vertical: w * .02,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     width: w * .42,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Color.fromRGBO(239, 240, 246, 1),
//                                       ),
//                                       borderRadius: BorderRadius.circular(
//                                         w * .02,
//                                       ),
//                                     ),
//                                     child: Buttons(
//                                       buttonColor: Colors.white,
//                                       //   buttonWidth: w * .1,
//                                       onTap: () {},
//                                       imageBeforeText: SizedBox(
//                                         width: w * .05,
//                                         height: w * .05,
//                                         child: Image.asset(
//                                           "assets/images/googleIcon.png",
//                                         ),
//                                       ),
//                                       buttonText: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           SizedBox(width: w * .01),
//                                           AppFonts.textPoppins(
//                                             context,
//                                             "Google",
//                                             w * .04,
//                                             FontWeight.w500,
//                                             ColorsList.titleTextColor,
//                                             TextAlign.start,
//                                             TextOverflow.ellipsis,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),

//                                   Container(
//                                     width: w * .42,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Color.fromRGBO(239, 240, 246, 1),
//                                       ),
//                                       borderRadius: BorderRadius.circular(
//                                         w * .02,
//                                       ),
//                                     ),
//                                     child: Buttons(
//                                       buttonColor: Colors.white,
//                                       // buttonWidth: w * .1,
//                                       onTap: () {
//                                         // CustomNavigator().navigatePushMethod(
//                                         //   context,
//                                         //   SignupDetailsScreen(),
//                                         // );
//                                       },
//                                       imageBeforeText: SizedBox(
//                                         width: w * .05,
//                                         height: w * .05,
//                                         child: Image.asset(
//                                           "assets/images/fbIcon.png",
//                                         ),
//                                       ),
//                                       buttonText: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           SizedBox(width: w * .01),
//                                           AppFonts.textPoppins(
//                                             context,
//                                             "Facebook",
//                                             w * .04,
//                                             FontWeight.w500,
//                                             ColorsList.titleTextColor,
//                                             TextAlign.start,
//                                             TextOverflow.ellipsis,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: w * .05),
//                             Buttons(
//                               onTap: () {
//                                 // move to enter otp screen
//                                 //   Navigator.push(context, MaterialPageRoute(builder: (context)=>EnterOtpScreen()));
//                                 //======navigate to otp screen===//
//                                 // CustomNavigator().navigatePushMethod(
//                                 //   context,
//                                 //   EnterOtpScreen(),
//                                 // );
//                               },
//                               buttonText: AppFonts.textPoppins(
//                                 context,
//                                 "Login",
//                                 w * .05,
//                                 FontWeight.w500,
//                                 ColorsList.mainButtonTextColor,
//                                 TextAlign.center,
//                                 TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
