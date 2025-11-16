import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/configs/theme/app_colors.dart';
import 'package:movie_zone/presentation/search/cubits/selected_option/selected_option_cubit.dart';

class SelectableOption extends StatelessWidget {
  const SelectableOption({
    super.key,
    required this.title,
    required this.searchType,
    required this.onTap,
  });

  final String title;
  final SearchType searchType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedOptionCubit, SearchType>(
      builder: (context, selectedType) {
        final isSelected = selectedType == searchType;
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : const Color.fromARGB(49, 158, 158, 158),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      },
    );
  }
}
