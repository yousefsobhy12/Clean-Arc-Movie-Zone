import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/cubits/trailer_cubit/trailer_cubit.dart';
import 'package:movie_zone/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_zone/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviesTrailerWidget extends StatelessWidget {
  const MoviesTrailerWidget({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrailerCubit()
            ..getTrailer(id, serviceLocator<GetMovieTrailerUsecase>()),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrailerLoaded) {
            return ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: YoutubePlayer(
                controller: state.youtubePlayerController,
                showVideoProgressIndicator: true,
              ),
            );
          }
          if (state is TrailerFailed) {
            const Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}
