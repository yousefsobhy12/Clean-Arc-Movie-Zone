import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/presentation/home/cubits/trending_cubit/trending_cubit.dart';
import 'package:movie_zone/presentation/watch_list/cubit/watch_list_cubit.dart';
import 'package:movie_zone/presentation/watch_list/widgets/custom_watchlist_widget.dart';

class Watchlistcreen extends StatelessWidget {
  const Watchlistcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchListCubit()..loadWatchList(),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 90.h),
            BlocBuilder<WatchListCubit, WatchListState>(
              builder: (context, state) {
                if (state is WatchListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is WatchListLoaded) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return CustomWatchlistWidget(watchListEntity: state.list[index],);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 25);
                        },
                      ),
                    ),
                  );
                }
                if (state is WatchListError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
