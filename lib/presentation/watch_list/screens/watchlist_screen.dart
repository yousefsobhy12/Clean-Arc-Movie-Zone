import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/core/configs/assets/app_vectors.dart';
import 'package:movie_zone/presentation/home/cubits/trending_cubit/trending_cubit.dart';
import 'package:movie_zone/presentation/watch/screens/movie_watch_screen.dart';
import 'package:movie_zone/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_zone/presentation/watch_list/widgets/custom_watchlist_card.dart';

class Watchlistcreen extends StatelessWidget {
  const Watchlistcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 90.h),
            BlocBuilder<TrendingCubit, TrendingState>(
              builder: (context, state) {
                if (state is TrendingMovieLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is TrendingMovieLoaded) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              AppNavigator.push(
                                context,
                                MovieWatchScreen(
                                  movieEntity: state.movies[index],
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 200,
                              child: Row(
                                spacing: 12,
                                children: [
                                  CustomWatchlistCard(
                                    movieEntity: state.movies[index],
                                  ),
                                  Expanded(
                                    child: Column(
                                      spacing: 7.h,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.movies[index].title!,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.amber,
                                            ),
                                            Text(
                                              ' ${state.movies[index].voteAverage!.toStringAsFixed(1)} (${state.movies[index].voteCount})',
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            VideoReleaseDate(
                                              releaseDate: state
                                                  .movies[index]
                                                  .releaseDate!,
                                            ),
                                            SvgPicture.asset(
                                              width: 14,
                                              AppVectors.bookmarkIcon,
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          state.movies[index].overview!,
                                          maxLines: 3,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 25);
                        },
                      ),
                    ),
                  );
                }
                if (state is TrendingMovieFailure) {
                  return Center(child: Text(state.errorMessage));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
