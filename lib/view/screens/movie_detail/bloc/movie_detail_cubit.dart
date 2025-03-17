import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/movid_detail_model.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/view/screens/movie_detail/bloc/movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(this.movieRepository) : super(MovieDetailInitial());

  final MovieRepository movieRepository;

  Future<void> fetchMovieDetail(num movieId) async {
    try {
      emit(MovieDetailLoading());
      final movieRes = await movieRepository.getMovieDetail(movieId);
      if (movieRes is String) {
        emit(MovieDetailError(movieRes));
        return;
      }

      final movie = MovieDetail.fromJson(movieRes);
      emit(MovieDetailLoaded(movie));
    } catch (e) {
      emit(MovieDetailError('Failed to fetch movie details'));
    }
  }
}
