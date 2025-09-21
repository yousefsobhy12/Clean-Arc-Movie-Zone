import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/presentation/search/cubits/search/search_cubit.dart';
import 'package:movie_zone/presentation/search/cubits/selected_option/selected_option_cubit.dart';

// ignore: must_be_immutable
class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key, this.suffixIcon});
  IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().controller,
      onChanged: (value) {
        context.read<SearchCubit>().search(
          value,
          context.read<SelectedOptionCubit>().state,
        );
      },
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
        suffixIcon: suffixIcon ?? Icon(Icons.abc, color: Colors.transparent),
        suffixIconColor: Colors.grey,
        enabledBorder: outlineInputBorder(borderColor: Colors.transparent),
        focusedBorder: outlineInputBorder(borderColor: Colors.transparent),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
