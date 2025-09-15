import 'package:dartz/dartz.dart';
import 'package:movie_zone/common/helper/mapper/tv_mapper.dart';
import 'package:movie_zone/data/tv/models/tv_model.dart';
import 'package:movie_zone/data/tv/sources/tv_service.dart';
import 'package:movie_zone/domain/tv/repositories/tv_repo.dart';
import 'package:movie_zone/service_locator.dart';

class TvRepoImpl extends TvRepo {
  @override
  Future<Either> getPopularTvShows() async {
    var returnedData = await serviceLocator<TvService>().getPopularTvShows();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var popularTv = List.from(
          data['content'],
        ).map((item) => TvMapper.toEntity(TvModel.fromJson(item))).toList();
        return Right(popularTv);
      },
    );
  }

  @override
  Future<Either> getRecommendedTvShows(int tvShowId) async {
    var returnedData = await serviceLocator<TvService>().getRecommendedTvShows(
      tvShowId,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tvShows = List.from(
          data['content'],
        ).map((item) => TvMapper.toEntity(TvModel.fromJson(item))).toList();
        return Right(tvShows);
      },
    );
  }

  @override
  Future<Either> getSimilarTvShows(int tvShowId) async {
    var returnedData = await serviceLocator<TvService>().getSimilarTvShows(
      tvShowId,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tvShows = List.from(
          data['content'],
        ).map((item) => TvMapper.toEntity(TvModel.fromJson(item))).toList();
        return Right(tvShows);
      },
    );
  }
}
