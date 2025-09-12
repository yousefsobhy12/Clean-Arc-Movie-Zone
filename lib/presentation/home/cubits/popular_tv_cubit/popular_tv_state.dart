part of 'popular_tv_cubit.dart';

sealed class PopularTvState {}

final class PopularTvInitial extends PopularTvState {}

final class PopularTvLoading extends PopularTvState {}

final class PopularTvLoaded extends PopularTvState {
  final List<TvEntity> popularTv;

  PopularTvLoaded({required this.popularTv});
}

final class PopularTvFailure extends PopularTvState {
  final String errorMessage;

  PopularTvFailure({required this.errorMessage});
}
