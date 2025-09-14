import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/widgets/movie/movie_slider.dart';
import 'package:movie_zone/presentation/home/cubits/trending_cubit/trending_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({super.key});

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  int activeIndex = 2;
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
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index, realIndex) {
                    return MovieSliderCard(movieEntity: state.movies[index]);
                  },
                  options: CarouselOptions(
                    height: 370,
                    viewportFraction: 0.5,
                    initialPage: 2,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: state.movies.length,
                  effect: ExpandingDotsEffect(activeDotColor: Colors.red),
                ),
              ],
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
