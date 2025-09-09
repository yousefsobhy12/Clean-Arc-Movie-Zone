import 'package:dartz/dartz.dart';

abstract class MovieRepo {
  Future<Either> getTrendingMovies();
}
