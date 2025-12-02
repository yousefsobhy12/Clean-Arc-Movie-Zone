import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/domain/watchlist/entities/watchlist_entity.dart';
import 'package:movie_zone/domain/watchlist/usecases/add_watchlist_usecase.dart';
import 'package:movie_zone/domain/watchlist/usecases/get_all_watchlist_usecase.dart';
import 'package:movie_zone/domain/watchlist/usecases/is_watchlist_usecase.dart';
import 'package:movie_zone/domain/watchlist/usecases/remove_watchlist_usecase.dart';
import 'package:movie_zone/domain/watchlist/usecases/watch_watchlist_usecase.dart';
import 'package:movie_zone/service_locator.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(WatchListInitial());
  final addUC = serviceLocator<AddWatchListUsecase>();
  final removeUC = serviceLocator<RemoveWatchListUsecase>();
  final isInUC = serviceLocator<IsWatchListUsecase>();
  final getAllUC = serviceLocator<GetAllWatchListUsecase>();
  final watchUC = serviceLocator<WatchWatchListUsecase>();

  // Add
  Future<void> addToWatchList(WatchListEntity item) async {
    emit(WatchListLoading());
    try {
      await addUC(item);
      emit(WatchListAdded());
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }

  // Remove
  Future<void> removeFromWatchList(String movieId) async {
    emit(WatchListLoading());
    try {
      await removeUC(movieId);
      emit(WatchListRemoved());
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }

  // Toggle
  Future<void> toggleWatchList(WatchListEntity item) async {
    final exists = await isInUC(item.movieId);
    if (exists) {
      await removeFromWatchList(item.movieId);
    } else {
      await addToWatchList(item);
    }
  }

  // Check status
  Future<void> checkWatchListStatus(String movieId) async {
    try {
      final exists = await isInUC(movieId);
      emit(WatchListStatusLoaded(exists));
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }

  // Load all
  Future<void> loadWatchList() async {
    emit(WatchListLoading());
    try {
      final list = await getAllUC();
      emit(WatchListLoaded(list));
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }

  // Stream
  void watchWatchList() {
    emit(WatchListLoading());
    final stream = watchUC();

    stream.listen(
      (list) {
        emit(WatchListLoaded(list));
      },
      onError: (err) {
        emit(WatchListError(err.toString()));
      },
    );
  }
}
