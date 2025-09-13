import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/presentation/watch/cubit/trailer_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMovieTrailer(movieId),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return Center(child: CircularProgressIndicator());
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
            Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}
