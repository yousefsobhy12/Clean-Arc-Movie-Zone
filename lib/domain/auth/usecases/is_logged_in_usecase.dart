import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';
import 'package:movie_zone/service_locator.dart';

class IsLoggedInUsecase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await serviceLocator<AuthRepo>().isLoggedIn();
  }
}
