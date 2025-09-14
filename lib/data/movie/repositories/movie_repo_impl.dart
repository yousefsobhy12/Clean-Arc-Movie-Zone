import 'package:dartz/dartz.dart';
import 'package:movie_zone/common/helper/mapper/movie_mapper.dart';
import 'package:movie_zone/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_zone/core/models/trailer_model.dart';
import 'package:movie_zone/data/movie/models/movie_model.dart';
import 'package:movie_zone/data/movie/sources/movie_service.dart';
import 'package:movie_zone/domain/movie/repositories/movie_repo.dart';
import 'package:movie_zone/service_locator.dart';

class MovieRepoImpl extends MovieRepo {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await serviceLocator<MovieService>().getTrendingMovies();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((movie) => MovieMapper.toEntity(MovieModel.fromJson(movie)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await serviceLocator<MovieService>()
        .getNowPlayingMovies();
    return returnedData.fold(
      (error) {
        return left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((movie) => MovieMapper.toEntity(MovieModel.fromJson(movie)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnedData = await serviceLocator<MovieService>().getMovieTrailer(
      movieId,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer'])),
        );
      },
    );
  }

  @override
  Future<Either> getRecommendedMovies(int movieId) async {
    var returnedData = await serviceLocator<MovieService>()
        .getRecommendedMovies(movieId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var returnedData = await serviceLocator<MovieService>().getSimilarMovies(
      movieId,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }
}
