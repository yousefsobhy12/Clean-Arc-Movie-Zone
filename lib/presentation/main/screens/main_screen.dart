import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/configs/assets/app_vectors.dart';
import 'package:movie_zone/core/configs/theme/app_colors.dart';
import 'package:movie_zone/presentation/home/screens/home_screen.dart';
import 'package:movie_zone/presentation/profile/screens/profile_screen.dart';
import 'package:movie_zone/presentation/search/screens/search_screen.dart';
import 'package:movie_zone/presentation/wishlist/screens/wishlist_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final screens = const [
    HomeScreen(),
    SearchScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTabChange(int index) {
    if (index != selectedIndex) {
      _animationController.reset();
      setState(() {
        selectedIndex = index;
      });
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: screens[selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: AppColors.background,
        selectedIndex: selectedIndex,
        items: [
          FlashyTabBarItem(
            activeColor: AppColors.primary,
            icon: SvgPicture.asset(
              AppVectors.homeIcon,
              color: Colors.white,
            ),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            activeColor: AppColors.primary,
            icon: SvgPicture.asset(
              AppVectors.searchIcon,
              color: Colors.white,
            ),
            title: const Text('Search'),
          ),
          FlashyTabBarItem(
            activeColor: AppColors.primary,
            icon: SvgPicture.asset(
              AppVectors.wishlistIcon,
              color: Colors.white,
            ),
            title: const Text('Wishlist'),
          ),
          FlashyTabBarItem(
            activeColor: AppColors.primary,
            icon: SvgPicture.asset(
              AppVectors.profileIcon,
              color: Colors.white,
            ),
            title: const Text('Profile'),
          ),
        ],
        onItemSelected: _handleTabChange,
      ),
    );
  }
}