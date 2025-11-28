import 'package:movie_zone/domain/favourites/entities/watchlist_entity.dart';
import 'package:movie_zone/domain/favourites/repositories/watchlist_repo.dart';

class GetAllWatchlistUsecase {
  final WatchlistRepo repo;

  GetAllWatchlistUsecase(this.repo);

  Future<List<WatchlistEntity>> call() {
    return repo.getAllWatchlist();
  }
}
