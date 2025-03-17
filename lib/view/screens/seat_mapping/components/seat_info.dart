import 'package:movie_app/imports.dart';

class SeatInfo extends StatelessWidget {
  const SeatInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AssetIcons.seat,
                  color: Colors.orange,
                  height: 24,
                ),
                8.horizontalSpace,
                Text(
                  'Selected',
                  style: bodyMedium(context).copyWith(
                    color: theme.dividerColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            14.verticalSpace,
            Row(
              children: [
                SvgPicture.asset(
                  AssetIcons.seat,
                  color: Colors.purple,
                  height: 24,
                ),
                8.horizontalSpace,
                Text(
                  'VIP (150\$)',
                  style: bodyMedium(context).copyWith(
                    color: theme.dividerColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        24.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AssetIcons.seat,
                  color: Colors.grey,
                  height: 24,
                ),
                8.horizontalSpace,
                Text(
                  'Not Available',
                  style: bodyMedium(context).copyWith(
                    color: theme.dividerColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            14.verticalSpace,
            Row(
              children: [
                SvgPicture.asset(
                  AssetIcons.seat,
                  color: Colors.blue,
                  height: 24,
                ),
                8.horizontalSpace,
                Text(
                  'Regular (50\$)',
                  style: bodyMedium(context).copyWith(
                    color: theme.dividerColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
