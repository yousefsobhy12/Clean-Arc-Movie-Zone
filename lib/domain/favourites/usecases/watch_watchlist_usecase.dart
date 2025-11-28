import 'package:movie_zone/domain/favourites/entities/watchlist_entity.dart';
import 'package:movie_zone/domain/favourites/repositories/watchlist_repo.dart';

class WatchWatchlistUsecase {
  final WatchlistRepo repo;

  WatchWatchlistUsecase(this.repo);

  Stream<List<WatchlistEntity>> call() {
    return repo.watchWatchlist();
  }
}
