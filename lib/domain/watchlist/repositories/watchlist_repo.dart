import '../entities/watchlist_entity.dart';

abstract class WatchlistRepo {
  Future<void> addWatchlist(WatchListEntity fav);
  Future<void> removeWatchlist(String movieId);
  Future<bool> isWatchlist(String movieId);
  Future<List<WatchListEntity>> getAllWatchlist();
  Stream<List<WatchListEntity>> watchWatchlist();
}
