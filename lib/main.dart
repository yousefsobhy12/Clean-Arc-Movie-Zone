import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/configs/theme/app_theme.dart';
import 'package:movie_zone/core/prefs/app_prefs.dart';
import 'package:movie_zone/presentation/splash/cubit/splash_cubit.dart';
import 'package:movie_zone/presentation/splash/screens/splash_screen.dart';
import 'package:movie_zone/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await AppPrefs.init();
  runApp(const MovieZone());
}

class MovieZone extends StatelessWidget {
  const MovieZone({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: SplashScreen(),
      ),
    );
  }
}

// MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: AppTheme.appTheme,
//         home: SplashScreen(),
//       ),
