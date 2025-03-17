// ignore_for_file: deprecated_member_use

import 'package:movie_app/imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.text = '',
    this.backgroundColor,
    this.textColor,
    this.height,
    this.borderRadius = 6,
  });

  final VoidCallback? onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 54.sp,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.sp),
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: bodyLarge(context).copyWith(
              fontWeight: FontWeight.w700,
              color: textColor ?? Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
