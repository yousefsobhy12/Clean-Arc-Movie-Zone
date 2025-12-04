import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/widgets/default_text_form_field.dart';
import 'package:movie_zone/presentation/search/cubits/search/search_cubit.dart';
import 'package:movie_zone/presentation/search/cubits/selected_option/selected_option_cubit.dart';

// ignore: must_be_immutable
class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key, this.suffixIcon});
  IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      fillColor: const Color(0xff2B2B2B),
      controller: context.read<SearchCubit>().controller,
      onChanged: (value) {
        context.read<SearchCubit>().search(
          value,
          context.read<SelectedOptionCubit>().state,
        );
      },
      hint: 'Search...',
    );
  }
}
