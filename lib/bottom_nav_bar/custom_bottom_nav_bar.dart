import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nzcu_user/author_screens/login_signup_screen.dart';
import 'package:nzcu_user/bottom_nav_bar/favourites_screen.dart';
import 'package:nzcu_user/bottom_nav_bar/home_screen.dart';
import 'package:nzcu_user/bottom_nav_bar/profile_screen.dart';
import 'package:nzcu_user/bottom_nav_bar/rides_screen.dart';
import 'package:nzcu_user/demo_screen.dart';
import 'package:nzcu_user/utils/with_animations/colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = const <Widget>[
    HomeScreen(),
    RidesScreen(),
    FavouritesScreen(),
    ProfileScreen(),
  ];

  final List<String> _labels = const <String>[
    'Home',
    'Rides',
    'Favorites',
    'Profile',
  ];

  final List<String> _icons = const <String>[
    'assets/icons/homeIcon.png',
    'assets/icons/scootyIcon.png',
    'assets/icons/fvrtIcon.png',
    'assets/icons/profileIcon.png',
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              //  blurRadius: 2,
              color: Colors.grey.shade300,
              spreadRadius: 1,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: _currentIndex == 0 || _currentIndex == 3
                ? EdgeInsets.symmetric(horizontal: w * .04, vertical: w * .03)
                : EdgeInsets.symmetric(horizontal: w * .06, vertical: w * .03),
            child: GNav(
              gap: w * .01,
              tabMargin: EdgeInsets.symmetric(horizontal: w * .005),
              rippleColor: Colors.grey.shade300,
              hoverColor: Colors.grey.shade300,
              activeColor: AppColors.primaryblue,
              //  iconSize: w * .08,
              padding: EdgeInsets.symmetric(
                horizontal: w * .035,
                vertical: w * .03,
              ),
              duration: Duration(milliseconds: 300),
              tabBackgroundColor: AppColors.primaryblue.withOpacity(0.2),
              color: Colors.grey[200],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() => _currentIndex = index);
              },
              tabs: List.generate(_labels.length, (index) {
                return GButton(
                  icon: Icons.circle,
                  text: _labels[index],
                  textSize: w * .05,
                  leading: Image.asset(
                    _icons[index],
                    width: w * .06,
                    height: w * .06,
                    color: _currentIndex == index
                        ? AppColors.primaryblue
                        : AppColors.mediumGray,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
