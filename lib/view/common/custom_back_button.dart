import 'package:movie_app/imports.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).dividerColor),
        borderRadius: borderRadiusSmall,
      ),
      child: InkWell(
        onTap: () {
          pop();
        },
        child: Padding(
          padding: EdgeInsets.only(left: 8.sp),
          child: Center(child: Icon(Icons.arrow_back_ios, size: 20.sp)),
        ),
      ),
    );
  }
}
