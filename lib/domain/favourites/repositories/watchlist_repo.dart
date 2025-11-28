import '../entities/watchlist_entity.dart';

abstract class WatchlistRepo {
  Future<void> addWatchlist(WatchlistEntity fav);
  Future<void> removeWatchlist(String movieId);
  Future<bool> isWatchlist(String movieId);
  Future<List<WatchlistEntity>> getAllWatchlist();
  Stream<List<WatchlistEntity>> watchWatchlist();
}
