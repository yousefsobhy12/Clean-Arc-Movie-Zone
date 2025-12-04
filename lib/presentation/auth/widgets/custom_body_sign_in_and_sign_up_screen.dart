import 'package:flutter/material.dart';
import 'package:movie_zone/core/configs/assets/app_images.dart';

// ignore: must_be_immutable
class CustomBodySignAndSignUpScreen extends StatelessWidget {
  CustomBodySignAndSignUpScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.splashBackground),
        ),
      ),
      child: child,
    );
  }
}
