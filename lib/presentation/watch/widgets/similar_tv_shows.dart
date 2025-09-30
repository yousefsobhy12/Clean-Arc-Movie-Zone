import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/cubits/generic_data_cubit/generic_data_cubit.dart';
import 'package:movie_zone/common/widgets/tv/tv_card.dart';
import 'package:movie_zone/domain/tv/entities/tv_entity.dart';
import 'package:movie_zone/domain/tv/usecases/get_similar_tv_shows_usecase.dart';
import 'package:movie_zone/service_locator.dart';

class SimilarTvShows extends StatelessWidget {
  const SimilarTvShows({super.key, required this.tvShowId});
  final int tvShowId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<TvEntity>>(
          serviceLocator<GetSimilarTvShowsUsecase>(),
          params: tvShowId,
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            return Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Similar',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TvCard(tvEntity: state.data[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 20);
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
