import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/core/configs/assets/app_gifs.dart';
import 'package:movie_zone/core/configs/assets/app_images.dart';
import 'package:movie_zone/domain/movie/entities/movie.dart';
import 'package:movie_zone/presentation/watch/screens/movie_watch_screen.dart';

import '../../../core/configs/theme/app_colors.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieCard({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, MovieWatchScreen(movieEntity: movieEntity));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: CachedNetworkImage(
                imageUrl: AppImages.posterBasePath + movieEntity.posterPath,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: imageProvider,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(AppGifs.cinema),
                  ),
                ),

                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieEntity.title!,
                      style: const TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        Text(
                          ' ${movieEntity.voteAverage!.toStringAsFixed(1)}',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
