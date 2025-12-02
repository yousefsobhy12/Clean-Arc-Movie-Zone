import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/common/widgets/app_bar.dart';
import 'package:movie_zone/core/configs/assets/app_vectors.dart';
import 'package:movie_zone/domain/tv/entities/tv_entity.dart';
import 'package:movie_zone/domain/watchlist/entities/watchlist_entity.dart';
import 'package:movie_zone/presentation/home/screens/home_screen.dart';
import 'package:movie_zone/presentation/watch/widgets/recommended_tv_shows.dart';
import 'package:movie_zone/presentation/watch/widgets/similar_tv_shows.dart';
import 'package:movie_zone/presentation/watch/widgets/tv_show_keywords.dart';
import 'package:movie_zone/presentation/watch/widgets/tv_shows_trailer.dart';
import 'package:movie_zone/presentation/watch/widgets/video_overview.dart';
import 'package:movie_zone/presentation/watch/widgets/video_title.dart';
import 'package:movie_zone/presentation/watch/widgets/video_vote_avg.dart';
import 'package:movie_zone/presentation/watch_list/cubit/watch_list_cubit.dart';

class TvWatchScreen extends StatelessWidget {
  const TvWatchScreen({super.key, required this.tvEntity});
  final TvEntity tvEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchListCubit(),
      child: Scaffold(
        appBar: BasicAppbar(
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
              TvShowsTrailer(id: tvEntity.id!),
              const SizedBox(height: 16),
              VideoTitle(
                title: tvEntity.name!,
                id: tvEntity.id.toString(),
                watchListEntity: WatchListEntity(
                  movieId: tvEntity.id.toString(),
                  title: tvEntity.name!,
                  posterPath: tvEntity.posterPath,
                  rate: tvEntity.voteAverage!,
                ),
              ),
              const SizedBox(height: 6),
              TvShowKeywords(id: tvEntity.id!),
              const SizedBox(height: 6),
              VideoVoteAvg(
                voteAvg: tvEntity.voteAverage!.toStringAsFixed(1),
                voteCount: tvEntity.voteCount.toString(),
              ),
              const SizedBox(height: 16),
              VideoOverview(overview: tvEntity.overview!),
              const SizedBox(height: 16),
              RecommendedTvShows(tvEntityId: tvEntity.id!),
              const SizedBox(height: 16),
              SimilarTvShows(tvShowId: tvEntity.id!),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
