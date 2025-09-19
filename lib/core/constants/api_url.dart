class ApiUrl {
  static const String baseUrl = 'http://10.0.2.2:3000/';
  static const String apiVersion = 'api/v1/';

  // Authentication
  static const String signupUrl = '${apiVersion}auth/signup';
  static const String signinUrl = '${apiVersion}auth/signin';

  // Trending Movies
  static const String trendingUrl = '${apiVersion}movie/trending';

  // Now Playing Movies
  static const String nowPlayingUrl = '${apiVersion}movie/nowplaying';

  // For Movies Trailer
  static const String movieUrl = '${apiVersion}movie/';
  static const String tvShowUrl = '${apiVersion}tv/';

  // Popular TV shows
  static const String popularTvUrl = '${apiVersion}tv/popular';

  // For TV shows Trailer
  static const String tvShows = '${apiVersion}tv/';

  // Search Url
  static const String search = '${apiVersion}search/';
}
