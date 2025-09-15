import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/domain/tv/repositories/tv_repo.dart';
import 'package:movie_zone/service_locator.dart';

class GetRecommendedTvShowsUsecase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await serviceLocator<TvRepo>().getRecommendedTvShows(params!);
  }
}
