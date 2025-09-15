part of 'trailer_cubit.dart';

sealed class TrailerState {}

final class TrailerInitial extends TrailerState {}

final class TrailerLoading extends TrailerState {}

final class TrailerLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;

  TrailerLoaded({required this.youtubePlayerController});
}

final class TrailerFailed extends TrailerState {
  final String errorMessage;

  TrailerFailed({required this.errorMessage});
}
