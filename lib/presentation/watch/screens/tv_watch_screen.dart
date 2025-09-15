import 'package:flutter/material.dart';
import 'package:movie_zone/common/widgets/app_bar/app_bar.dart';
import 'package:movie_zone/domain/tv/entities/tv_entity.dart';
import 'package:movie_zone/presentation/watch/widgets/recommended_movies.dart';
import 'package:movie_zone/presentation/watch/widgets/similar_movies.dart';
import 'package:movie_zone/presentation/watch/widgets/video_overview.dart';
import 'package:movie_zone/presentation/watch/widgets/video_player.dart';
import 'package:movie_zone/presentation/watch/widgets/video_title.dart';
import 'package:movie_zone/presentation/watch/widgets/video_vote_avg.dart';

class TvWatchScreen extends StatelessWidget {
  const TvWatchScreen({super.key, required this.tvEntity});
  final TvEntity tvEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VideoPlayerWidget(movieId: tvEntity.id!),
            SizedBox(height: 16),
            VideoTitle(title: tvEntity.name!),
            SizedBox(height: 6),
            VideoVoteAvg(voteAvg: tvEntity.voteAverage!.toStringAsFixed(1)),
            SizedBox(height: 16),
            VideoOverview(overview: tvEntity.overview!),
            SizedBox(height: 16),
            RecommendedMovies(movieId: tvEntity.id!),
            SizedBox(height: 16),
            SimilarMovies(movieId: tvEntity.id!),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
