import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/imports.dart';
import 'package:movie_app/view/screens/video_player/bloc/video_cubit.dart';
import 'package:movie_app/view/screens/video_player/bloc/video_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final num movieId;

  const VideoPlayerScreen({super.key, required this.movieId});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  void initState() {
    BlocProvider.of<VideoCubit>(context).fetchTrailerUrl(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          if (state is VideoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is VideoLoaded) {
            return VideoApp(
              trailerUrl:
                  "https://www.youtube.com/watch?v=${state.youtubeVideokey}",
            );
          } else if (state is VideoError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key, required this.trailerUrl});
  final String trailerUrl;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.trailerUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
    _controller.toggleFullScreenMode();
    _controller.addListener(() {
      if (_controller.value.playerState == PlayerState.ended) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    if (_controller.value.isFullScreen) {
      _controller.toggleFullScreenMode();
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
