import 'package:flutter/material.dart';
import 'package:movie_zone/common/widgets/app_bar/app_bar.dart';
import 'package:movie_zone/domain/movie/entities/movie.dart';
import 'package:movie_zone/presentation/watch/widgets/video_overview.dart';
import 'package:movie_zone/presentation/watch/widgets/video_player.dart';
import 'package:movie_zone/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_zone/presentation/watch/widgets/video_title.dart';
import 'package:movie_zone/presentation/watch/widgets/video_vote_avg.dart';

class MovieWatchScreen extends StatelessWidget {
  const MovieWatchScreen({super.key, required this.movieEntity});
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayerWidget(movieId: movieEntity.id!),
            SizedBox(height: 16),
            VideoTitle(title: movieEntity.title!),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAvg(
                  voteAvg: movieEntity.voteAverage!.toStringAsFixed(1),
                ),
              ],
            ),
            SizedBox(height: 16),
            VideoOverview(overview: movieEntity.overview!),
          ],
        ),
      ),
    );
  }
}
