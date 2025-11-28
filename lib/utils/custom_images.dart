import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';

class CustomImages {
  static Widget images(
    String imagePath,
    double width,
    double height, {
    Color? color,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(imagePath, color: color),
    );
  }

  static Widget customCard({
    required BuildContext context,
    Color? backgroundColor,
    double? borderRadius,
    Widget? widget1,
    double? containerWidth,
    double? containerHeight,
    Color? borderColor,
    double? blurRadius,
  }) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: containerWidth ?? w * .4,
      height: containerHeight ?? w * .2,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? w * .02),
        boxShadow: [
          BoxShadow(
            color: borderColor ?? Colors.black12,
            spreadRadius: 1,
            blurRadius: blurRadius ?? 6,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: widget1,
    );
  }
}
