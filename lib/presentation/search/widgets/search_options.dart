import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/presentation/search/cubits/search/search_cubit.dart';
import 'package:movie_zone/presentation/search/cubits/selected_option/selected_option_cubit.dart';
import 'package:movie_zone/presentation/search/widgets/selectable_option.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectableOption(
          title: 'Movie',
          searchType: SearchType.movie,
          onTap: () {
            context.read<SelectedOptionCubit>().selectMovie();
            context.read<SearchCubit>().search(
              context.read<SearchCubit>().controller.text,
              context.read<SelectedOptionCubit>().state,
            );
          },
        ),
        SelectableOption(
          title: 'TV',
          searchType: SearchType.tv,
          onTap: () {
            context.read<SelectedOptionCubit>().selectTv();
            context.read<SearchCubit>().search(
              context.read<SearchCubit>().controller.text,
              context.read<SelectedOptionCubit>().state,
            );
          },
        ),
      ],
    );
  }
}
