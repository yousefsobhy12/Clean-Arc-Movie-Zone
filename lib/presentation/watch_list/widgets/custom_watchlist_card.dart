import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_zone/core/configs/assets/app_gifs.dart';
import 'package:movie_zone/core/configs/assets/app_images.dart';
import 'package:movie_zone/domain/watchlist/entities/watchlist_entity.dart';

class CustomWatchlistCard extends StatelessWidget {
  const CustomWatchlistCard({super.key, required this.watchListEntity});
  final WatchListEntity watchListEntity;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.72,
      child: CachedNetworkImage(
        imageUrl: AppImages.posterBasePath + watchListEntity.posterPath,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(fit: BoxFit.fill, image: imageProvider),
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
    );
  }
}
