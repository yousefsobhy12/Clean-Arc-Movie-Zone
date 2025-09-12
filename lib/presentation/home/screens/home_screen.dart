import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/common/widgets/app_bar/app_bar.dart';
import 'package:movie_zone/core/configs/assets/app_vectors.dart';
import 'package:movie_zone/presentation/home/widgets/category_title.dart';
import 'package:movie_zone/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_zone/presentation/home/widgets/popular_tv.dart';
import 'package:movie_zone/presentation/home/widgets/trending_movies.dart';

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
          children: [
            CategoryTitle(title: 'Trending 🔥'),
            TrendingMovies(),
            SizedBox(height: 16),
            CategoryTitle(title: 'Now Playing'),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 16),
            CategoryTitle(title: 'Popular TV'),
            SizedBox(height: 16),
            PopularTvShows(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
