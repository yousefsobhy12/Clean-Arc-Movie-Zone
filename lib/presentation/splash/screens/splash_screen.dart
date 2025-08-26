import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/presentation/auth/screens/sign_in_screen.dart';

import '../../../common/helper/navigation/app_navigation.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../home/screens/home_screen.dart';
import '../cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, SignInScreen());
          }

          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, const HomeScreen());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff1A1B20).withOpacity(0),
                    const Color(0xff1A1B20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
