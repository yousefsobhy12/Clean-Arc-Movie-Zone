import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/widgets/movie/movie_card.dart';
import 'package:movie_zone/presentation/home/cubits/now_playing_cubit/now_playing_cubit.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
          if (state is NowPlayingLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is NowPlayingLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: MovieCard(movieEntity: state.movies[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20);
                },
                itemCount: state.movies.length,
              ),
            );
            // return FanCarouselImageSlider.sliderType1(
            //   initalPageIndex: 2,
            //   imagesLink: state.movies
            //       .map(
            //         (item) =>
            //             AppImages.movieImageBasePath +
            //             item.posterPath.toString(),
            //       )
            //       .toList(),
            //   isAssets: false,
            //   autoPlay: false,
            //   sliderHeight: 400,
            //   showIndicator: true,
            // );
          }
          if (state is NowPlayingFailure) {
            return Center(
              child: Text('Oops there\'s an error: ${state.errorMessage}'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
