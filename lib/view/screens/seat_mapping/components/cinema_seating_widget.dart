import 'package:movie_app/data/model/seat_model.dart';
import 'package:movie_app/imports.dart';
import 'package:movie_app/main.dart';

class CinemaCurvedScreen extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint =
        Paint()
          ..color = blueColor
          ..style = PaintingStyle.stroke;

    final shadowPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [blueColor.withOpacity(0.2), blueColor.withOpacity(0.01)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final textPainter = TextPainter(
      text: TextSpan(
        text: 'Screen',
        style: bodySmall(navigatorKey.currentContext!).copyWith(
          color: Theme.of(navigatorKey.currentContext!).dividerColor,
          fontSize: size.width * 0.04,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    final offset = Offset(
      (size.width - textPainter.width) / 2,
      size.height * .6,
    );
    textPainter.paint(canvas, offset);

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);
    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CinemaSeating extends StatelessWidget {
  final int maxSeatNumber = 18;
  final int spacing = 5;
  final List<int> skipPattern = [6, 2, 2, 2, 0, 0, 0, 0, 0];
  final int totalLength = 9;
  final bool allowNumbering;
  final List<SeatModel> selectedSeats;
  final List<SeatModel> vipSeats;
  final List<SeatModel> regularSeats;
  final Function(int row, int seat) onSeatSelected;
  final bool isViewonly;

  CinemaSeating({
    super.key,
    this.allowNumbering = false,
    required this.onSeatSelected,
    required this.selectedSeats,
    required this.vipSeats,
    required this.regularSeats,
    this.isViewonly = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double seatSize =
            (constraints.maxWidth / (maxSeatNumber + spacing)) * 0.7;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Isolate the screen painting so it won't rebuild unnecessarily.
            RepaintBoundary(
              child: CustomPaint(
                painter: CinemaCurvedScreen(),
                size: Size(constraints.maxWidth, constraints.maxWidth * 0.2),
              ),
            ),
            12.verticalSpace,
            ...List.generate(totalLength, (rowIndex) {
              final int skipStart = skipPattern[rowIndex] ~/ 2;
              final int skipEnd = skipPattern[rowIndex] - skipStart;

              return Row(
                children: [
                  if (allowNumbering) ...[
                    Text(
                      '${rowIndex + 1}',
                      style: bodySmall(context).copyWith(
                        fontSize: seatSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: seatSize),
                  ],
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(maxSeatNumber, (index) {
                        final bool shouldSkip =
                            index < skipStart ||
                            index >= maxSeatNumber - skipEnd;

                        final bool addSpace =
                            index + 1 == spacing ||
                            index + spacing + 1 == maxSeatNumber;

                        if (shouldSkip) {
                          return SizedBox(
                            key: ValueKey('skip_${rowIndex}_$index'),
                            width: seatSize,
                            height: seatSize,
                          );
                        }

                        return Padding(
                          padding:
                              addSpace
                                  ? EdgeInsets.only(right: seatSize)
                                  : EdgeInsets.all(seatSize * 0.3),
                          child: SeatWidget(
                            key: ValueKey('seat_${rowIndex}_$index'),
                            row: rowIndex,
                            seat: index,
                            seatSize: seatSize,
                            isViewonly: isViewonly,
                            onSeatSelected: onSeatSelected,
                            isSelected: isSeatSelected(rowIndex, index),
                            isPremium: isPremium(rowIndex, index),
                            isRegular: isRegular(rowIndex, index),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            }),
          ],
        );
      },
    );
  }

  bool isSeatSelected(int row, int seat) {
    return selectedSeats.any(
      (element) => element.row == row && element.seat == seat,
    );
  }

  bool isPremium(int row, int seat) {
    return vipSeats.any(
      (element) => element.row == row && element.seat == seat,
    );
  }

  bool isRegular(int row, int seat) {
    return regularSeats.any(
      (element) => element.row == row && element.seat == seat,
    );
  }
}

/// A separate widget for an individual seat.
/// This widget only rebuilds when its own state changes.
class SeatWidget extends StatelessWidget {
  final int row;
  final int seat;
  final double seatSize;
  final bool isViewonly;
  final Function(int row, int seat) onSeatSelected;
  final bool isSelected;
  final bool isPremium;
  final bool isRegular;

  const SeatWidget({
    super.key,
    required this.row,
    required this.seat,
    required this.seatSize,
    required this.isViewonly,
    required this.onSeatSelected,
    required this.isSelected,
    required this.isPremium,
    required this.isRegular,
  });

  @override
  Widget build(BuildContext context) {
    Color seatColor;
    if (isSelected) {
      seatColor = Colors.orange;
    } else if (isPremium) {
      seatColor = Colors.purple;
    } else if (isRegular) {
      seatColor = Colors.blue;
    } else {
      seatColor = Colors.grey;
    }

    return InkWell(
      onTap: () {
        if (!isViewonly && (isPremium || isRegular)) {
          onSeatSelected(row, seat);
        }
      },
      child: SvgPicture.asset(
        AssetIcons.seat,
        height: seatSize,
        width: seatSize,
        color: seatColor,
      ),
    );
  }
}
