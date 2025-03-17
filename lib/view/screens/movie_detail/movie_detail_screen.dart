import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/imports.dart';
import 'package:movie_app/view/screens/movie_detail/bloc/movie_detail_cubit.dart';
import 'package:movie_app/view/screens/movie_detail/bloc/movie_detail_state.dart';
import 'package:movie_app/view/screens/movie_detail/components/genre_and_overview_widget.dart';
import 'package:movie_app/view/screens/movie_detail/components/movie_and_info_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.id});
  final num id;
  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<MovieDetailCubit>(context).fetchMovieDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        leading: BackButton(color: theme.colorScheme.onPrimary),
        backgroundColor: Colors.transparent,
        title: Text(
          'Watch',
          style: titleMedium(
            context,
          ).copyWith(color: theme.colorScheme.onPrimary),
        ),
      ),
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailError) {
            return Center(child: Text(state.error));
          } else if (state is MovieDetailLoaded) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                MovieAndInfoWidget(movieDetail: state.movie),
                GenreAndOverWidget(movieDetail: state.movie),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
