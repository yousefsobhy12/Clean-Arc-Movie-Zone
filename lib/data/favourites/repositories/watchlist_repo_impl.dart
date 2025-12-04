import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_zone/data/favourites/models/watchlist_model.dart';
import 'package:movie_zone/data/favourites/sources/watchlist_data_source.dart';
import 'package:movie_zone/domain/watchlist/entities/watchlist_entity.dart';
import 'package:movie_zone/domain/watchlist/repositories/watchlist_repo.dart';

class WatchlistRepoImpl implements WatchlistRepo {
  final WatchlistRemoteDataSource remote;

  WatchlistRepoImpl(this.remote);

  @override
  Future<void> addWatchlist(WatchListEntity fav) async {
    final model = WatchlistModel(
      movieId: fav.movieId,
      title: fav.title,
      posterPath: fav.posterPath,
      rate: fav.rate,
      addedAt: Timestamp.now(),
    );

    return remote.addwatchlist(model);
  }

  @override
  Future<void> removeWatchlist(String movieId) {
    return remote.removewatchlist(movieId);
  }

  @override
  Future<bool> isWatchlist(String movieId) {
    return remote.iswatchlist(movieId);
  }

  @override
  Future<List<WatchListEntity>> getAllWatchlist() async {
    final list = await remote.getAllwatchlist();

    return list
        .map(
          (m) => WatchListEntity(
            movieId: m.movieId,
            title: m.title,
            posterPath:
                m.posterPath ??
                'https://www.flaticon.com/free-icon/image-placeholder_8136031',
            rate: m.rate,
          ),
        )
        .toList();
  }

  @override
  Stream<List<WatchListEntity>> watchWatchlist() {
    return remote.watchwatchlist().map(
      (list) => list
          .map(
            (m) => WatchListEntity(
              movieId: m.movieId,
              title: m.title,
              posterPath:
                  m.posterPath ??
                  'https://www.flaticon.com/free-icon/image-placeholder_8136031',
              rate: m.rate,
            ),
          )
          .toList(),
    );
  }
}
