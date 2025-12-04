import 'package:movie_zone/domain/watchlist/entities/watchlist_entity.dart';
import 'package:movie_zone/domain/watchlist/repositories/watchlist_repo.dart';

class WatchWatchListUsecase {
  final WatchlistRepo repo;

  WatchWatchListUsecase(this.repo);

  Stream<List<WatchListEntity>> call() {
    return repo.watchWatchlist();
  }
}
