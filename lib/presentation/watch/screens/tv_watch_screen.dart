import 'package:flutter/material.dart';
import 'package:movie_zone/common/widgets/app_bar/app_bar.dart';
import 'package:movie_zone/domain/tv/entities/tv_entity.dart';
import 'package:movie_zone/presentation/watch/widgets/recommended_tv_shows.dart';
import 'package:movie_zone/presentation/watch/widgets/similar_tv_shows.dart';
import 'package:movie_zone/presentation/watch/widgets/tv_show_keywords.dart';
import 'package:movie_zone/presentation/watch/widgets/tv_shows_trailer.dart';
import 'package:movie_zone/presentation/watch/widgets/video_overview.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TvShowsTrailer(id: tvEntity.id!),
            SizedBox(height: 16),
            VideoTitle(title: tvEntity.name!),
            SizedBox(height: 6),
            TvShowKeywords(id: tvEntity.id!),
            SizedBox(height: 6),
            VideoVoteAvg(voteAvg: tvEntity.voteAverage!.toStringAsFixed(1)),
            SizedBox(height: 16),
            VideoOverview(overview: tvEntity.overview!),
            SizedBox(height: 16),
            RecommendedTvShows(tvEntityId: tvEntity.id!),
            SizedBox(height: 16),
            SimilarTvShows(tvShowId: tvEntity.id!),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
