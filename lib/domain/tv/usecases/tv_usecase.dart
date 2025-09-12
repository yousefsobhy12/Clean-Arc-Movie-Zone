import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/domain/tv/repositories/tv_repo.dart';
import 'package:movie_zone/service_locator.dart';

class GetPopularTvUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) {
    return serviceLocator<TvRepo>().getPopularTv();
  }
}
