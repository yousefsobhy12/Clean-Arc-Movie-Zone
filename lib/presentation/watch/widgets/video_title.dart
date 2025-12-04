import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/configs/assets/app_vectors.dart';
import 'package:movie_zone/domain/watchlist/entities/watchlist_entity.dart';
import 'package:movie_zone/presentation/watch_list/cubit/watch_list_cubit.dart';

class VideoTitle extends StatefulWidget {
  const VideoTitle({
    super.key,
    required this.title,
    required this.id,
    required this.watchListEntity,
  });

  final String title;
  final String id;
  final WatchListEntity watchListEntity;

  @override
  State<VideoTitle> createState() => _VideoTitleState();
}

class _VideoTitleState extends State<VideoTitle> {
  @override
  void initState() {
    super.initState();
    // Check if movie is already in watchlist
    context.read<WatchListCubit>().checkWatchListStatus(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        BlocBuilder<WatchListCubit, WatchListState>(
          builder: (context, state) {
            bool isInWatchList = false;
            bool isLoading = false;

            if (state is WatchListStatusLoaded) {
              isInWatchList = state.isInWatchList;
            } else if (state is WatchListAdded) {
              isInWatchList = true;
            } else if (state is WatchListRemoved) {
              isInWatchList = false;
            } else if (state is WatchListLoading) {
              isLoading = true;
            }

            return InkWell(
              onTap: isLoading
                  ? null
                  : () {
                      context.read<WatchListCubit>().toggleWatchList(
                        widget.watchListEntity,
                      );
                    },
              child: SvgPicture.asset(
                AppVectors.bookmarkIcon,
                // ignore: deprecated_member_use
                color: isInWatchList ? Colors.amber : Colors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}
