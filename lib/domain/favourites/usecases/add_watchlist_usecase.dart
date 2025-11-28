import 'package:movie_zone/domain/favourites/entities/watchlist_entity.dart';
import 'package:movie_zone/domain/favourites/repositories/watchlist_repo.dart';

class AddWatchlistUsecase {
  final WatchlistRepo repo;

  AddWatchlistUsecase(this.repo);

  Future<void> call(WatchlistEntity fav) {
    return repo.addWatchlist(fav);
  }
}
