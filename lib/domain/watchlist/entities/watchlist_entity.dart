class WatchListEntity {
  final String movieId;
  final String title;
  final String posterPath;
  final num rate;

  const WatchListEntity({
    required this.movieId,
    required this.title,
    required this.posterPath,
    required this.rate,
  });
}
