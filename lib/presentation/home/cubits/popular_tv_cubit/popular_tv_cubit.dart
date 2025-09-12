import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/domain/tv/entities/tv_entity.dart';
import 'package:movie_zone/domain/tv/usecases/tv_usecase.dart';
import 'package:movie_zone/service_locator.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvLoading());
  void getPopularTv() async {
    var returnedData = await serviceLocator<GetPopularTvUsecase>().call();
    returnedData.fold(
      (error) {
        emit(PopularTvFailure(errorMessage: error));
      },
      (data) {
        emit(PopularTvLoaded(popularTv: data));
      },
    );
  }
}
