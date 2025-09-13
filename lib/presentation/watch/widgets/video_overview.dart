import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  const VideoOverview({super.key, required this.overview});
  final String overview;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(overview),
      ],
    );
  }
}
