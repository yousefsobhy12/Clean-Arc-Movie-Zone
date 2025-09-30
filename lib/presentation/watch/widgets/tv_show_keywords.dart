import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/cubits/generic_data_cubit/generic_data_cubit.dart';
import 'package:movie_zone/core/entities/keywords.dart';
import 'package:movie_zone/domain/tv/usecases/get_tv_show_keywords_usecase.dart';
import 'package:movie_zone/service_locator.dart';

class TvShowKeywords extends StatelessWidget {
  const TvShowKeywords({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<KeywordsEntity>>(
          serviceLocator<GetTvShowKeywordsUsecase>(),
          params: id,
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            List<KeywordsEntity> keywords = state.data;
            return Wrap(
              spacing: 5,
              children: keywords
                  .map((keyword) => Chip(label: Text(keyword.name!)))
                  .toList(),
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
