import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/core/configs/assets/app_vectors.dart';
import 'package:movie_zone/domain/watchlist/entities/watchlist_entity.dart';
import 'package:movie_zone/presentation/watch/screens/movie_watch_screen.dart';
import 'package:movie_zone/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_zone/presentation/watch_list/widgets/custom_watchlist_card.dart';

class CustomWatchlistWidget extends StatelessWidget {
  const CustomWatchlistWidget({super.key, required this.watchListEntity});
  final WatchListEntity watchListEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: SizedBox(
        height: 200,
        child: Row(
          spacing: 12,
          children: [
            CustomWatchlistCard(watchListEntity: watchListEntity),
            Expanded(
              child: Column(
                spacing: 7.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    watchListEntity.title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                const   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Icon(Icons.star, size: 20, color: Colors.amber),
                      Text(
                        'asdasda',
                        // ' ${watchListEntity.voteAverage!.toStringAsFixed(1)} (${watchListEntity.voteCount})',
                        style:  TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     VideoReleaseDate(
                  //       releaseDate: movieEntity.releaseDate!,
                  //     ),
                  //     SvgPicture.asset(
                  //       width: 14,
                  //       AppVectors.bookmarkIcon,
                  //       color: Colors.yellow,
                  //     ),
                  //   ],
                  // ),
                  // Text(
                  //   watchListEntity.overview!,
                  //   maxLines: 3,
                  //   style: const TextStyle(
                  //     color: Colors.grey,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
