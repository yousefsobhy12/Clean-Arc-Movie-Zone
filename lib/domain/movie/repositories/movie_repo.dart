import 'package:dartz/dartz.dart';

abstract class MovieRepo {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
}
