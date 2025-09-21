import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/entities/trailer_entitiy.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getTrailer(int id, UseCase usecase) async {
    var returnedData = await usecase.call(params: id);
    returnedData.fold(
      (error) {
        emit(TrailerFailed(errorMessage: error));
      },
      (data) async {
        try {
          TrailerEntity trailerEntity = data;
          if (trailerEntity.key == null) {
            log('Invalid trailer key');
            emit(TrailerFailed(errorMessage: 'Invalid trailer key'));
            return;
          }

          YoutubePlayerController controller = YoutubePlayerController(
            initialVideoId: trailerEntity.key!,
            flags: const YoutubePlayerFlags(
              loop: false,
              autoPlay: false,
              mute: true,
            ),
          );
          emit(TrailerLoaded(youtubePlayerController: controller));
        } catch (e) {
          log('Error loading trailer');
          emit(TrailerFailed(errorMessage: 'Error loading trailer'));
        }
      },
    );
  }
}
