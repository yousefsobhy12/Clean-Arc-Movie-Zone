import 'package:flutter/material.dart';

class VideoReleaseDate extends StatelessWidget {
  const VideoReleaseDate({super.key, required this.releaseDate});
  final DateTime releaseDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_month_outlined, color: Colors.grey),
        Text(
          ' ${releaseDate.day}/${releaseDate.month}/${releaseDate.year}',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
