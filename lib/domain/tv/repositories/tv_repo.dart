import 'package:dartz/dartz.dart';

abstract class TvRepo {
  Future<Either> getPopularTvShows();
  Future<Either> getRecommendedTvShows(int tvShowId);
  Future<Either> getSimilarTvShows(int tvShowId);
}
