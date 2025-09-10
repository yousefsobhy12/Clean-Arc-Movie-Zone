import 'package:flutter/material.dart';

class TrendingTitle extends StatelessWidget {
  const TrendingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        'Trending 🔥',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
