import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/configs/assets/app_images.dart';
import 'package:movie_zone/presentation/home/cubit/trending_cubit.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingMovieLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is TrendingMovieLoaded) {
            return FanCarouselImageSlider.sliderType1(
              initalPageIndex: 2,
              imagesLink: state.movies
                  .map(
                    (item) =>
                        AppImages.movieImageBasePath +
                        item.posterPath.toString(),
                  )
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }
          if (state is TrendingMovieFailure) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();

          // return Container();
        },
      ),
    );
  }
}
