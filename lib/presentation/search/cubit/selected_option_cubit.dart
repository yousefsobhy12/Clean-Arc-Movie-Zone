import 'package:flutter_bloc/flutter_bloc.dart';

enum SelectedOption { movie, tv }

class SelectedOptionCubit extends Cubit<SelectedOption> {
  SelectedOptionCubit() : super(SelectedOption.movie);

  void selectMovie() => emit(SelectedOption.movie);
  void selectTv() => emit(SelectedOption.tv);
}
