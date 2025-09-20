import 'package:flutter/material.dart';
import 'package:movie_zone/presentation/search/cubits/selected_option/selected_option_cubit.dart';
import 'package:movie_zone/presentation/search/widgets/selectable_option.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key, required this.option});

  final SelectedOptionCubit option;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectableOption(
          title: 'Movie',
          isSelected: option.state == SearchType.movie,
          onTap: () {
            option.selectMovie();
          },
        ),
        SelectableOption(
          title: 'TV',
          isSelected: option.state == SearchType.tv,
          onTap: () {
            option.selectTv();
          },
        ),
      ],
    );
  }
}
