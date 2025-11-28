import 'package:cloud_firestore/cloud_firestore.dart';

class WatchlistModel {
  final String movieId;
  final String title;
  final String? posterPath;
  final num rate;
  final Timestamp addedAt;

  WatchlistModel({
    required this.movieId,
    required this.title,
    this.posterPath,
    required this.rate,
    required this.addedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'movieId': movieId,
      'title': title,
      'posterPath': posterPath,
      'rate': rate,
      'addedAt': addedAt,
    };
  }

  factory WatchlistModel.fromMap(Map<String, dynamic> map) {
    return WatchlistModel(
      movieId: map['movieId'] as String,
      title: map['title'] as String,
      posterPath: map['posterPath'] as String?,
      rate: map['rate'] as num,
      addedAt: map['addedAt'] as Timestamp? ?? Timestamp.now(),
    );
  }
}
