import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/widgets/app_bar/app_bar.dart';
import 'package:movie_zone/presentation/search/cubit/selected_option_cubit.dart';
import 'package:movie_zone/presentation/search/widgets/custom_search_text_field.dart';
import 'package:movie_zone/presentation/search/widgets/selectable_option.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => SelectedOptionCubit())],
        child: BlocBuilder<SelectedOptionCubit, SearchType>(
          builder: (context, state) {
            final option = context.read<SelectedOptionCubit>();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  CustomSearchTextField(
                    hintText: 'Search...',
                    controller: searchController,
                  ),
                  SizedBox(height: 12),
                  Row(
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
