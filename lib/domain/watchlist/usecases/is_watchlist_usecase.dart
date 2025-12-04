import 'package:movie_zone/domain/watchlist/repositories/watchlist_repo.dart';

class IsWatchListUsecase {
  final WatchlistRepo repo;

  IsWatchListUsecase(this.repo);

  Future<bool> call(String movieId) {
    return repo.isWatchlist(movieId);
  }
}
