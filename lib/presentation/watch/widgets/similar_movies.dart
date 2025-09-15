import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/cubits/generic_data_cubit/generic_data_cubit.dart';
import 'package:movie_zone/common/widgets/movie/movie_card.dart';
import 'package:movie_zone/domain/movie/entities/movie.dart';
import 'package:movie_zone/domain/movie/usecases/get_similar_movies.dart';
import 'package:movie_zone/service_locator.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<MovieEntity>>(
          serviceLocator<GetSimilarMovies>(),
          params: movieId,
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            return Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.data[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 20);
                    },
                    itemCount: state.data.length,
                  ),
                ),
              ],
            );
          }
          if (state is DataFailed) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }
}
