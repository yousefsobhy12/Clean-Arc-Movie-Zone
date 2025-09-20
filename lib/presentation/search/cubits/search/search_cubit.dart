import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/domain/movie/entities/movie.dart';
import 'package:movie_zone/domain/movie/usecases/search_movies_usecase.dart';
import 'package:movie_zone/domain/tv/entities/tv_entity.dart';
import 'package:movie_zone/domain/tv/usecases/search_tv_shows_usecase.dart';
import 'package:movie_zone/presentation/search/cubits/selected_option/selected_option_cubit.dart';
import 'package:movie_zone/service_locator.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());
      switch (searchType) {
        case SearchType.movie:
          searchMovies(query);
          break;
        case SearchType.tv:
          searchTVShows(query);
          break;
      }
    }
  }

  void searchMovies(String query) async {
    var returnedData = await serviceLocator<SearchMoviesUsecase>().call(
      params: query,
    );
    returnedData.fold(
      (errorMessage) {
        emit(SearchFailure(errorMessage: errorMessage));
      },
      (movies) {
        emit(MoviesLoaded(movies: movies));
      },
    );
  }

  void searchTVShows(String query) async {
    var returnedData = await serviceLocator<SearchTVShowsUsecase>().call(
      params: query,
    );
    returnedData.fold(
      (errorMessage) {
        emit(SearchFailure(errorMessage: errorMessage));
      },
      (tvShows) {
        emit(TVShowsLoaded(tvShows: tvShows));
      },
    );
  }
}
