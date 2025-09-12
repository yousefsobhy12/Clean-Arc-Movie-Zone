import 'package:dartz/dartz.dart';

abstract class TvRepo {
  Future<Either> getPopularTv();
}
