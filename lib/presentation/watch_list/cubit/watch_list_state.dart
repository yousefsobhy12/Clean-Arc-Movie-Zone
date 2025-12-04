part of 'watch_list_cubit.dart';

sealed class WatchListState {}

class WatchListInitial extends WatchListState {}

class WatchListLoading extends WatchListState {}

class WatchListAdded extends WatchListState {}

class WatchListRemoved extends WatchListState {}

class WatchListLoaded extends WatchListState {
  final List<WatchListEntity> list;
  WatchListLoaded(this.list);
}

class WatchListStatusLoaded extends WatchListState {
  final bool isInWatchList;
  WatchListStatusLoaded(this.isInWatchList);
}

class WatchListError extends WatchListState {
  final String message;
  WatchListError(this.message);
}