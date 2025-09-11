part of 'trending_cubit.dart';

sealed class TrendingState {}

final class TrendingInitial extends TrendingState {}

final class TrendingMovieLoading extends TrendingState {}

final class TrendingMovieLoaded extends TrendingState {
  final List<MovieEntity> movies;

  TrendingMovieLoaded({required this.movies});
}

final class TrendingMovieFailure extends TrendingState {
  final String errorMessage;

  TrendingMovieFailure({required this.errorMessage});
}
