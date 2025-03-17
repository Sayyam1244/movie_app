abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final String youtubeVideokey;

  VideoLoaded(this.youtubeVideokey);
}

class VideoError extends VideoState {
  final String message;

  VideoError(this.message);
}
