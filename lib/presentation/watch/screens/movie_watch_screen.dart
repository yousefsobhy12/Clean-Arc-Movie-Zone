import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/common/widgets/app_bar/app_bar.dart';
import 'package:movie_zone/core/configs/assets/app_vectors.dart';
import 'package:movie_zone/domain/movie/entities/movie.dart';
import 'package:movie_zone/presentation/home/screens/home_screen.dart';
import 'package:movie_zone/presentation/watch/widgets/recommended_movies.dart';
import 'package:movie_zone/presentation/watch/widgets/similar_movies.dart';
import 'package:movie_zone/presentation/watch/widgets/video_overview.dart';
import 'package:movie_zone/presentation/watch/widgets/movies_trailer.dart';
import 'package:movie_zone/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_zone/presentation/watch/widgets/video_title.dart';
import 'package:movie_zone/presentation/watch/widgets/video_vote_avg.dart';

class MovieWatchScreen extends StatelessWidget {
  const MovieWatchScreen({super.key, required this.movieEntity});
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        action: IconButton(
          onPressed: () {
            AppNavigator.pushReplacement(context, const HomeScreen());
          },
          // ignore: deprecated_member_use
          icon: SvgPicture.asset(AppVectors.homeIcon, color: Colors.grey),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviesTrailerWidget(id: movieEntity.id!),
            const SizedBox(height: 16),
            VideoTitle(title: movieEntity.title!),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAvg(
                  voteAvg: movieEntity.voteAverage!.toStringAsFixed(1),
                ),
              ],
            ),
            const SizedBox(height: 16),
            VideoOverview(overview: movieEntity.overview!),
            const SizedBox(height: 16),
            RecommendedMovies(movieId: movieEntity.id!),
            const SizedBox(height: 16),
            SimilarMovies(movieId: movieEntity.id!),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
