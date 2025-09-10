import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/common/widgets/app_bar/app_bar.dart';
import 'package:movie_zone/core/configs/assets/app_vectors.dart';
import 'package:movie_zone/presentation/home/widgets/trending_movies.dart';
import 'package:movie_zone/presentation/home/widgets/trending_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [TrendingTitle(), TrendingMovies()],
        ),
      ),
    );
  }
}
