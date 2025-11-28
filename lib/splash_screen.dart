import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nzcu_user/author_screens/login_signup_screen.dart';
import 'package:nzcu_user/utils/with_animations/app_buttons.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';
import 'package:nzcu_user/utils/with_animations/custom_font.dart';
import 'package:nzcu_user/utils/with_animations/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      CustomNavigator.removeUntil(
        context,
        const LoginSignupScreen(),
        transition: TransitionType.fade,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: w * .12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/splash1.png",
                    width: w * 0.6,
                    fit: BoxFit.contain,
                  ),

                  // Second Image Centered
                  Image.asset(
                    "assets/images/splash3.png",
                    width: w * 0.25,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/splash2.png", width: w * .7),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * .03,
                vertical: w * .08,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppFonts.textRubik(
                        context,
                        "Your best ride experience starts with us.",
                        w * .065,
                        FontWeight.w500,
                        AppColors.black,
                        TextAlign.center,
                        TextOverflow.visible,
                        maxLines: 2,
                      )
                      .animate()
                      .fade(duration: 1000.ms, curve: Curves.easeInOut)
                      .scale(
                        begin: const Offset(0.95, 0.95),
                        end: const Offset(1, 1),
                      ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: w * .02),
                    child:
                        AppFonts.textRubik(
                              context,
                              "We take the wheel for your Comfort.",
                              w * .038,
                              FontWeight.w400,
                              AppColors.mediumGray,
                              TextAlign.center,
                              TextOverflow.visible,
                              maxLines: 2,
                            )
                            .animate()
                            .fade(duration: 1000.ms, curve: Curves.easeInOut)
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
    );
  }
}
