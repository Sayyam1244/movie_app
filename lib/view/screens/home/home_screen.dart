import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/imports.dart';
import 'package:movie_app/view/screens/home/bloc/movie_list_cubit.dart';
import 'package:movie_app/view/screens/home/bloc/movie_list_state.dart';
import 'package:movie_app/view/screens/home/components/movie_shimmer.dart';
import 'package:movie_app/view/screens/home/components/movie_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<MovieListCubit>(context).fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.onPrimary,
        title: Text('Watch', style: titleMedium(context)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: theme.colorScheme.primary),
          ),
        ],
      ),
      backgroundColor: theme.colorScheme.surface,
      body: BlocBuilder<MovieListCubit, MovieListState>(
        builder: (context, state) {
          if (state is MovieListLoading) {
            return ListView.separated(
              padding: paddingDefault,
              itemCount: 4,
              separatorBuilder:
                  (BuildContext context, int index) => 12.verticalSpace,
              itemBuilder: (context, index) {
                return MovieShimmerWidget();
              },
            );
          } else if (state is MovieListLoaded) {
            return ListView.separated(
              itemCount: state.movies.length,
              padding: paddingDefault,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return MovieTile(movie: movie);
              },
              separatorBuilder:
                  (BuildContext context, int index) => 12.verticalSpace,
            );
          } else if (state is MovieListError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 70,
                    color: theme.colorScheme.error,
                  ),
                  16.verticalSpace,
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: bodyLarge(
                      context,
                    ).copyWith(color: theme.colorScheme.error),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
