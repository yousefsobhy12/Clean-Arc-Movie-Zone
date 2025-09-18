import 'package:flutter/material.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/core/configs/assets/app_images.dart';
import 'package:movie_zone/domain/movie/entities/movie.dart';
import 'package:movie_zone/presentation/watch/screens/movie_watch_screen.dart';

class MovieSliderCard extends StatelessWidget {
  const MovieSliderCard({super.key, required this.movieEntity});
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, MovieWatchScreen(movieEntity: movieEntity));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              AppImages.posterBasePath + movieEntity.posterPath.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
