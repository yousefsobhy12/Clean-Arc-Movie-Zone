import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/common/widgets/app_bar/app_bar.dart';
import 'package:movie_zone/core/configs/assets/app_vectors.dart';
import 'package:movie_zone/presentation/home/widgets/category_title.dart';
import 'package:movie_zone/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_zone/presentation/home/widgets/popular_tv.dart';
import 'package:movie_zone/presentation/home/widgets/trending_movies.dart';
import 'package:movie_zone/presentation/search/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectors.logo),
        action: IconButton(
          onPressed: () {
            AppNavigator.push(context, const SearchScreen());
          },
          icon: SvgPicture.asset(
            height: 22,
            AppVectors.searchIcon,
            // ignore: deprecated_member_use
            color: Colors.grey,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryTitle(title: 'Trending 🔥'),
            TrendingMovies(),
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
