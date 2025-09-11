part of 'now_playing_cubit.dart';

sealed class NowPlayingState {}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingLoaded extends NowPlayingState {
  final List<MovieEntity> movies;

  NowPlayingLoaded({required this.movies});
}

final class NowPlayingFailure extends NowPlayingState {
  final String errorMessage;

  NowPlayingFailure({required this.errorMessage});
}
