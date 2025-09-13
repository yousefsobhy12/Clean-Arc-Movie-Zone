import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/entities/trailer_entitiy.dart';
import 'package:movie_zone/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_zone/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());
  void getMovieTrailer(int movieId) async {
    var returnedData = await serviceLocator<GetMovieTrailer>().call(
      params: movieId,
    );
    returnedData.fold(
      (error) {
        emit(TrailerFailed(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: YoutubePlayerFlags(loop: false, autoPlay: false, mute: true),
        );
        emit(TrailerLoaded(youtubePlayerController: controller));
      },
    );
  }
}
