import 'package:movie_app/data/model/movie_model.dart';

abstract class MovieListState {}

class MovieListInitial extends MovieListState {}

class MovieListLoading extends MovieListState {}

class MovieListLoaded extends MovieListState {
  final List<Movie> movies;

  MovieListLoaded(this.movies);
}

class MovieListError extends MovieListState {
  final String message;

  MovieListError(this.message);
}
