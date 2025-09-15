import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
part 'generic_data_state.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  void getData<T>(UseCase usecase, {dynamic params}) async {
    var returnedData = await usecase.call(params: params);
    returnedData.fold(
      (error) {
        emit(DataFailed(errorMessage: error));
      },
      (data) {
        emit(DataLoaded(data: data));
      },
    );
  }
}
