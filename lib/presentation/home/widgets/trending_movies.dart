import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/cubits/generic_data_cubit/generic_data_cubit.dart';
import 'package:movie_zone/common/widgets/movie/movie_slider.dart';
import 'package:movie_zone/domain/movie/entities/movie.dart';
import 'package:movie_zone/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_zone/service_locator.dart';
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
      create: (context) => GenericDataCubit()
        ..getData<List<MovieEntity>>(
          serviceLocator<GetTrendingMoviesUseCase>(),
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index, realIndex) {
                    return MovieSliderCard(movieEntity: state.data[index]);
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
                  count: state.data.length,
                  effect: ExpandingDotsEffect(activeDotColor: Colors.red),
                ),
              ],
            );
          }
          if (state is DataFailed) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();

          // return Container();
        },
      ),
    );
  }
}
