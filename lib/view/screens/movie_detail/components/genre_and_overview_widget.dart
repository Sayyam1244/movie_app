import 'package:movie_app/data/model/movid_detail_model.dart';
import 'package:movie_app/imports.dart';

class GenreAndOverWidget extends StatelessWidget {
  const GenreAndOverWidget({super.key, required this.movieDetail});

  final MovieDetail movieDetail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: paddingDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Genres', style: titleMedium(context)),
          10.verticalSpace,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                movieDetail.genres!
                    .map(
                      (e) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          e.name!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
          ),
          22.verticalSpace,
          Divider(color: theme.colorScheme.primary.withOpacity(0.1)),
          15.verticalSpace,

          Text('Overview', style: titleMedium(context)),
          14.verticalSpace,
          Text(
            movieDetail.overview!,
            style: bodyLarge(context).copyWith(color: theme.dividerColor),
          ),
        ],
      ),
    );
  }
}
