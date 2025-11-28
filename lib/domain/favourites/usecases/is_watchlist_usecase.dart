import 'package:movie_zone/domain/favourites/repositories/watchlist_repo.dart';

class IsWatchlistUsecase {
  final WatchlistRepo repo;

  IsWatchlistUsecase(this.repo);

  Future<bool> call(String movieId) {
    return repo.isWatchlist(movieId);
  }
}
