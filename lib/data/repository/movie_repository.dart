import 'package:movie_app/core/api/api_services.dart';
import 'package:movie_app/imports.dart';

class MovieRepository {
  final ApiServices apiServices;

  MovieRepository({required this.apiServices});

  Future getMovies() async {
    return await apiServices.getApi(url: AppConstants.upcomingMovies);
  }

  Future getMovieDetail(num movieId) async {
    return await apiServices.getApi(url: AppConstants.movieDetails(movieId));
  }

  Future getMovieVideos(num movieId) async {
    return await apiServices.getApi(url: AppConstants.movieVideos(movieId));
  }
}
