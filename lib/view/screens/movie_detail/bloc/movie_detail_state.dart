import 'package:movie_app/data/model/movid_detail_model.dart';

abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movie;

  MovieDetailLoaded(this.movie);
}

class MovieDetailError extends MovieDetailState {
  final String error;

  MovieDetailError(this.error);
}
