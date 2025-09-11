import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/domain/movie/entities/movie.dart';
import 'package:movie_zone/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_zone/service_locator.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMovieLoading());

  void getTrendingMovies() async {
    var returnedData = await serviceLocator<GetTrendingMoviesUseCase>().call();
    returnedData.fold(
      (error) {
        return emit(TrendingMovieFailure(errorMessage: error));
      },
      (data) {
        return emit(TrendingMovieLoaded(movies: data));
      },
    );
  }
}
