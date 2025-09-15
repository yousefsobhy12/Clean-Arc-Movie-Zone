import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/cubit/generic_data_cubit.dart';
import 'package:movie_zone/common/widgets/tv/tv_card.dart';
import 'package:movie_zone/domain/tv/entities/tv_entity.dart';
import 'package:movie_zone/domain/tv/usecases/tv_usecase.dart';
import 'package:movie_zone/service_locator.dart';

class PopularTvShows extends StatelessWidget {
  const PopularTvShows({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<TvEntity>>(serviceLocator<GetPopularTvShowsUsecase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: TvCard(tvEntity: state.data[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20);
                },
                itemCount: state.data.length,
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
