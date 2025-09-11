import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/domain/movie/entities/movie.dart';
import 'package:movie_zone/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_zone/service_locator.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingLoading());
  void getNowPlayingMovies() async {
    var returnedData = await serviceLocator<GetNowPlayingMovies>().call();
    returnedData.fold(
      (error) {
        return emit(NowPlayingFailure(errorMessage: error));
      },
      (data) {
        return emit(NowPlayingLoaded(movies: data));
      },
    );
  }
}
