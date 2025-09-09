class ApiUrl {
  static const String baseUrl = 'http://10.0.2.2:3000/';
  static const String apiVersion = 'api/v1/';

  // Authentication
  static const String signupUrl = '${apiVersion}auth/signup';
  static const String signinUrl = '${apiVersion}auth/signin';

  // Trending Movies
  static const String trendingUrl = '${apiVersion}movie/trending';
}
