import 'package:movie_zone/domain/watchlist/entities/watchlist_entity.dart';
import 'package:movie_zone/domain/watchlist/repositories/watchlist_repo.dart';

class AddWatchListUsecase {
  final WatchlistRepo repo;

  AddWatchListUsecase(this.repo);

  Future<void> call(WatchListEntity fav) {
    return repo.addWatchlist(fav);
  }
}
