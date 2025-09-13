import 'package:flutter/material.dart';
import 'package:movie_zone/common/widgets/app_bar/app_bar.dart';
import 'package:movie_zone/domain/movie/entities/movie.dart';
import 'package:movie_zone/presentation/watch/widgets/video_player.dart';

class MovieWatchScreen extends StatelessWidget {
  const MovieWatchScreen({super.key, required this.movieEntity});
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [VideoPlayerWidget(movieId: movieEntity.id!)]),
      ),
    );
  }
}
