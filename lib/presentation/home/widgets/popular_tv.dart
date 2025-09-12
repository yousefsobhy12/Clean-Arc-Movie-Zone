import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/widgets/tv/tv_card.dart';
import 'package:movie_zone/presentation/home/cubits/popular_tv_cubit/popular_tv_cubit.dart';

class PopularTvShows extends StatelessWidget {
  const PopularTvShows({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTvCubit()..getPopularTv(),
      child: BlocBuilder<PopularTvCubit, PopularTvState>(
        builder: (context, state) {
          if (state is PopularTvLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PopularTvLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: TvCard(tvEntity: state.popularTv[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20);
                },
                itemCount: state.popularTv.length,
              ),
            );
          }
          if (state is PopularTvFailure) {
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
