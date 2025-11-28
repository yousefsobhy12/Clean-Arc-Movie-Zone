import 'package:movie_zone/domain/favourites/repositories/watchlist_repo.dart';

class RemoveWatchlistUsecase {
  final WatchlistRepo repo;

  RemoveWatchlistUsecase(this.repo);

  Future<void> call(String movieId) {
    return repo.removeWatchlist(movieId);
  }
}
