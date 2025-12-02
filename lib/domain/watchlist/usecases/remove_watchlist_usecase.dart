import 'package:movie_zone/domain/watchlist/repositories/watchlist_repo.dart';

class RemoveWatchListUsecase {
  final WatchlistRepo repo;

  RemoveWatchListUsecase(this.repo);

  Future<void> call(String movieId) {
    return repo.removeWatchlist(movieId);
  }
}
