import 'package:dartz/dartz.dart';

abstract class MovieRepo {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendedMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
}
