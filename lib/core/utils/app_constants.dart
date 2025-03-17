class AppConstants {
  //app
  static const String appName = 'movie_app';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String apiKey = 'c5619032599dcff162707e8b0ad03af1';
  // static const String apiHeader =
  //     'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNTYxOTAzMjU5OWRjZmYxNjI3MDdlOGIwYWQwM2FmMSIsIm5iZiI6MTY5ODI5MjY2My4xMzQsInN1YiI6IjY1MzllM2I3OTU1YzY1MDEzOGJjMzkxZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yCPnLedDD93lu00XjtFRruW-moXRzxmaeuKdaoMbcow';

  //endpoints
  static const String upcomingMovies =
      '$baseUrl/movie/upcoming?api_key=$apiKey';
  static String movieDetails(num movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';
  static String movieVideos(num movieId) =>
      '$baseUrl/movie/$movieId/videos?api_key=$apiKey';
}
