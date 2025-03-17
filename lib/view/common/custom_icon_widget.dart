import 'package:movie_app/imports.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.iconPath,
    required this.onPressed,
    super.key,
    this.showAlert = false,
  });
  final String iconPath;
  final VoidCallback onPressed;
  final bool showAlert;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.sp,
      width: 36.sp,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 36.sp,
            width: 36.sp,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              shape: BoxShape.circle,
            ),
            child: MaterialButton(
              padding: const EdgeInsets.all(9),
              onPressed: onPressed,
              child: SvgPicture.asset(
                iconPath,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.circle,
              color: Theme.of(context).colorScheme.error,
              size: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
