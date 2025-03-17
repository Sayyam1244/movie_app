import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/imports.dart';
import 'package:movie_app/view/screens/movie_detail/movie_detail_screen.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 180.sp,
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: borderRadiusSmall,
      ),
      child: InkWell(
        onTap: () {
          launchScreen(MovieDetailScreen(id: movie.id!));
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: "${AppConstants.imageBaseUrl}${movie.posterPath}",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 70.sp,

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: paddingDefault,
                child: Text(
                  movie.title!,
                  style: titleLarge(
                    context,
                  ).copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
