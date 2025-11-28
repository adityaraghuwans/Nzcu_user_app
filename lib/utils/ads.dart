import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  final Widget widget;
  Ads({super.key, required this.widget});
  final List<String> imagePaths = [
    'assets/images/adsImage.png',
    'assets/images/adsImage.png',
    'assets/images/adsImage.png',
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: w * .25,
          autoPlay: true,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
        ),
        items: imagePaths.map((path) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * .05),
                  image: DecorationImage(
                    image: AssetImage(path),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
