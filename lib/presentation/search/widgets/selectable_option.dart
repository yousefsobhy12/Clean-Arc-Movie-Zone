import 'package:flutter/material.dart';
import 'package:movie_zone/core/configs/theme/app_colors.dart';

class SelectableOption extends StatelessWidget {
  const SelectableOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
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
  }
}
