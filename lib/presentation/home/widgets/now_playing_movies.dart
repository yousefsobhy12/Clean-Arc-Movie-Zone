import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/widgets/movie/movie_card.dart';
import 'package:movie_zone/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_zone/common/cubits/generic_data_cubit/generic_data_cubit.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData(GetNowPlayingMovies()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MovieCard(movieEntity: state.data[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 35);
                  },
                  itemCount: state.data.length,
                ),
              ),
            );
          }
          if (state is DataFailed) {
            return Center(
              child: Text('Oops there\'s an error: ${state.errorMessage}'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
