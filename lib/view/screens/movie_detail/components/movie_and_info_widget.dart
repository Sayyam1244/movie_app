import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/data/model/movid_detail_model.dart';
import 'package:movie_app/imports.dart';
import 'package:movie_app/view/screens/seat_mapping/seat_mapping_screen.dart';
import 'package:movie_app/view/screens/video_player/video_player.dart';

class MovieAndInfoWidget extends StatelessWidget {
  const MovieAndInfoWidget({super.key, required this.movieDetail});

  final MovieDetail movieDetail;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * .5,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: "${AppConstants.imageBaseUrl}${movieDetail.posterPath}",

              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .4,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'In Theaters ${DateFormat("MMMM dd, yyyy").format(movieDetail.releaseDate!)}',
                style: titleMedium(
                  context,
                ).copyWith(color: theme.colorScheme.onPrimary),
              ),
              15.verticalSpace,
              InkWell(
                onTap: () {
                  launchScreen(SeatMappingScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: borderRadiusSmall,
                  ),
                  child: Center(
                    child: Text(
                      'Get Tickets',
                      style: titleSmall(
                        context,
                      ).copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              InkWell(
                onTap: () {
                  launchScreen(VideoPlayerScreen(movieId: movieDetail.id!));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: blueColor),
                    borderRadius: borderRadiusSmall,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: theme.colorScheme.onPrimary,
                      ),
                      4.horizontalSpace,
                      Text(
                        'Watch Trailer',
                        style: titleSmall(
                          context,
                        ).copyWith(color: theme.colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),

              34.verticalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
