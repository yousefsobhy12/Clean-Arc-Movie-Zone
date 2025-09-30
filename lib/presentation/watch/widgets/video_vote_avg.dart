import 'package:flutter/material.dart';

class VideoVoteAvg extends StatelessWidget {
  const VideoVoteAvg({super.key, required this.voteAvg});
  final String voteAvg;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        const Icon(Icons.star_rounded, color: Colors.amber),
        Text(voteAvg),
      ],
    );
  }
}
