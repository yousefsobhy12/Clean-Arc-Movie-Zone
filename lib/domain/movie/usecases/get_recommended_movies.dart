import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/domain/movie/repositories/movie_repo.dart';
import 'package:movie_zone/service_locator.dart';

class GetRecommendedMovies extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await serviceLocator<MovieRepo>().getRecommendedMovies(params!);
  }
}
