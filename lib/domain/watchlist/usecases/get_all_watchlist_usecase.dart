import 'package:movie_zone/domain/watchlist/entities/watchlist_entity.dart';
import 'package:movie_zone/domain/watchlist/repositories/watchlist_repo.dart';

class GetAllWatchListUsecase {
  final WatchlistRepo repo;

  GetAllWatchListUsecase(this.repo);

  Future<List<WatchListEntity>> call() {
    return repo.getAllWatchlist();
  }
}
