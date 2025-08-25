import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_zone/core/configs/theme/app_theme.dart';

void main() {
  runApp(const MovieZone());
}

class MovieZone extends StatelessWidget {
  const MovieZone({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: Scaffold(),
    );
  }
}
