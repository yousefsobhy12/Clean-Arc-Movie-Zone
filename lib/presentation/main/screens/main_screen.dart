import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/configs/theme/app_colors.dart';
import 'package:movie_zone/presentation/favourite/screens/fav_screen.dart';
import 'package:movie_zone/presentation/home/screens/home_screen.dart';
import 'package:movie_zone/presentation/profile/screens/profile_screen.dart';
import 'package:movie_zone/presentation/search/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final screens = const [
    HomeScreen(),
    SearchScreen(),
    FavScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: AppColors.background,
        selectedIndex: selectedIndex,
        items: [
          FlashyTabBarItem(
            activeColor: AppColors.primary,
            icon: SvgPicture.asset(
              'assets/vectors/home_icon.svg',
              // ignore: deprecated_member_use
              color: Colors.white,
            ),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            activeColor: AppColors.primary,
            icon: SvgPicture.asset(
              'assets/vectors/search-icon.svg',
              // ignore: deprecated_member_use
              color: Colors.white,
            ),
            title: const Text('Search'),
          ),
          FlashyTabBarItem(
            activeColor: AppColors.primary,
            icon: SvgPicture.asset(
              'assets/vectors/fav-icon.svg',
              // ignore: deprecated_member_use
              color: Colors.white,
            ),
            title: const Text('Favourites'),
          ),
          FlashyTabBarItem(
            activeColor: AppColors.primary,
            icon: SvgPicture.asset(
              'assets/vectors/profile-icon.svg',
              // ignore: deprecated_member_use
              color: Colors.white,
            ),
            title: const Text('Profile'),
          ),
        ],
        onItemSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
