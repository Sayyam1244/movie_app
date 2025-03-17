import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/view/screens/home/bloc/movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit(this.movieRepository) : super(MovieListInitial());

  final MovieRepository movieRepository;
  Future<void> fetchMovies() async {
    try {
      emit(MovieListLoading());
      final movieRes = await movieRepository.getMovies();

      if (movieRes is String) {
        emit(MovieListError(movieRes));
        return;
      }

      final movies =
          (movieRes['results'] as List).map((e) => Movie.fromJson(e)).toList();
      emit(MovieListLoaded(movies));
    } catch (e) {
      emit(MovieListError('Failed to fetch movies'));
    }
  }
}
