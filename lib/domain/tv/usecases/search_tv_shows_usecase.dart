import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/domain/tv/repositories/tv_repo.dart';
import 'package:movie_zone/service_locator.dart';

class SearchTVShowsUsecase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await serviceLocator<TvRepo>().searchTVShows(params!);
  }
}
