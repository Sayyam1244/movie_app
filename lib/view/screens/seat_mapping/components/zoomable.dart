// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/data/model/seat_model.dart';
import 'package:movie_app/view/screens/seat_mapping/components/cinema_seating_widget.dart';

class ZoomableCinemaSeating extends StatefulWidget {
  final bool allowNumbering;
  final Function(int row, int seat) onSeatSelected;
  final List<SeatModel> selectedSeats;
  final List<SeatModel> vipSeats;
  final List<SeatModel> regularSeats;

  const ZoomableCinemaSeating({
    super.key,
    this.allowNumbering = true,
    required this.onSeatSelected,
    required this.selectedSeats,
    required this.vipSeats,
    required this.regularSeats,
  });

  @override
  _ZoomableCinemaSeatingState createState() => _ZoomableCinemaSeatingState();
}

class _ZoomableCinemaSeatingState extends State<ZoomableCinemaSeating> {
  double _scale = 1.0;
  final double _minScale = 1.0;
  final double _maxScale = 3.0;
  final double _scaleStep = 0.1;

  void _zoomIn() {
    setState(() {
      _scale = (_scale + _scaleStep).clamp(_minScale, _maxScale);
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = (_scale - _scaleStep).clamp(_minScale, _maxScale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InteractiveViewer(
            minScale: _minScale,
            maxScale: _maxScale,
            child: Transform.scale(
              scale: _scale,
              alignment: Alignment.topCenter,
              child: Padding(
                padding: paddingDefault,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,

                  child: CinemaSeating(
                    allowNumbering: widget.allowNumbering,
                    onSeatSelected: widget.onSeatSelected,
                    selectedSeats: widget.selectedSeats,
                    vipSeats: widget.vipSeats,
                    regularSeats: widget.regularSeats,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: paddingSmall,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                  border: Border.all(
                    color: Theme.of(context).dividerColor.withOpacity(0.2),
                  ),
                ),
                child: InkWell(
                  onTap: _zoomOut,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: const Icon(Icons.remove),
                  ),
                ),
              ),
              8.horizontalSpace,
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,

                  border: Border.all(
                    color: Theme.of(context).dividerColor.withOpacity(0.2),
                  ),
                ),
                child: InkWell(
                  onTap: _zoomIn,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
