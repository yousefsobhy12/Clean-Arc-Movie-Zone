import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/widgets/app_bar/app_bar.dart';
import 'package:movie_zone/presentation/search/cubits/search/search_cubit.dart';
import 'package:movie_zone/presentation/search/cubits/selected_option/selected_option_cubit.dart';
import 'package:movie_zone/presentation/search/widgets/custom_search_text_field.dart';
import 'package:movie_zone/presentation/search/widgets/search_content.dart';
import 'package:movie_zone/presentation/search/widgets/search_options.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectedOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: BlocBuilder<SelectedOptionCubit, SearchType>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  CustomSearchTextField(),
                  SizedBox(height: 12),
                  SearchOptions(),
                  SizedBox(height: 12),
                  Expanded(child: SearchContent()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
