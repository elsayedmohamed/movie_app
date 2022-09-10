class ApiConstance {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '9491f8704de1a9264409f9c3dee3d93f';
  static const nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';

  static String movieDetailPath(int moveId) =>
      '$baseUrl/movie/$moveId?api_key=$apiKey';

 static String movieRecommendationPath(int moveId) =>
      '$baseUrl/movie/$moveId/recommendations?api_key=$apiKey';
}
