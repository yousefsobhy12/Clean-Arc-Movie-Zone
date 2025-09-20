part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class MoviesLoaded extends SearchState {
  final List<MovieEntity> movies;

  MoviesLoaded({required this.movies});
}

final class TVShowsLoaded extends SearchState {
  final List<TvEntity> tvShows;

  TVShowsLoaded({required this.tvShows});
}

final class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure({required this.errorMessage});
}
