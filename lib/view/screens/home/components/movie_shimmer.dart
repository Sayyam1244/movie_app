import 'package:movie_app/imports.dart';
import 'package:shimmer/shimmer.dart';

class MovieShimmerWidget extends StatelessWidget {
  const MovieShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
      highlightColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
      child: Container(
        height: 180.sp,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
