import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/movie_trailer.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/view/screens/video_player/bloc/video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final MovieRepository movieRepository;
  VideoCubit(this.movieRepository) : super(VideoInitial());

  Future<void> fetchTrailerUrl(num movieId) async {
    emit(VideoLoading());
    try {
      final res = await movieRepository.getMovieVideos(movieId);

      if (res is String) {
        emit(VideoError(res));
        return;
      }
      List<MovieTrailer> trailers =
          (res['results'] as List)
              .map((e) => MovieTrailer.fromJson(e))
              .toList();
      if (trailers.isEmpty) {
        emit(VideoError("No Trailer available yet"));
        return;
      }

      emit(VideoLoaded(trailers.first.key!));
    } catch (e) {
      emit(VideoError("Failed to load trailer"));
    }
  }
}
