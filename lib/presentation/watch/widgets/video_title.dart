import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/configs/assets/app_vectors.dart';

class VideoTitle extends StatelessWidget {
  const VideoTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SvgPicture.asset(AppVectors.bookmarkIcon, color: Colors.white),
      ],
    );
  }
}
