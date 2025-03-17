import 'package:movie_app/data/model/seat_model.dart';
import 'package:movie_app/imports.dart';
import 'package:movie_app/view/screens/seat_mapping/components/seat_info.dart';
import 'package:movie_app/view/screens/seat_mapping/components/zoomable.dart';

class SeatMappingScreen extends StatefulWidget {
  const SeatMappingScreen({super.key});

  @override
  State<SeatMappingScreen> createState() => _SeatMappingScreenState();
}

class _SeatMappingScreenState extends State<SeatMappingScreen> {
  List<SeatModel> selectedSeats = [];
  List<SeatModel> vipSeats = [
    SeatModel(row: 3, seat: 12),
    SeatModel(row: 4, seat: 15),
    SeatModel(row: 4, seat: 7),
  ];
  List<SeatModel> regularSeats = [
    SeatModel(row: 2, seat: 14),
    SeatModel(row: 3, seat: 11),
    SeatModel(row: 4, seat: 17),
    SeatModel(row: 5, seat: 17),
    SeatModel(row: 6, seat: 4),
    SeatModel(row: 7, seat: 4),
    SeatModel(row: 8, seat: 12),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('The King’s Man'),
        backgroundColor: theme.colorScheme.onPrimary,
      ),
      backgroundColor: theme.colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: ZoomableCinemaSeating(
              onSeatSelected: (int row, int newSeat) {
                onSeatTap(row, newSeat);
              },
              selectedSeats: selectedSeats,
              vipSeats: vipSeats,
              regularSeats: regularSeats,
            ),
          ),

          Container(
            padding: paddingDefault,
            color: theme.colorScheme.onPrimary,
            child: Column(
              children: [
                SeatInfo(),
                24.verticalSpace,
                SizedBox(
                  height: 34,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final seat = selectedSeats[index];
                      return InkWell(
                        onTap: () {
                          selectedSeats.removeAt(index);
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: borderRadiusSmall,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${seat.seat} /',
                                style: titleSmall(context),
                              ),
                              Text(
                                ' ${seat.row} row ',
                                style: bodySmall(context),
                              ),
                              12.horizontalSpace,
                              Icon(Icons.close, size: 14),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => 10.horizontalSpace,
                    itemCount: selectedSeats.length,
                  ),
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: theme.dividerColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Price',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  '\$50',
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      flex: 4,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Proceed to pay',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onSeatTap(int row, int newSeat) {
    final seat = SeatModel(row: row, seat: newSeat);
    final existingSeat =
        selectedSeats
            .where((s) => s.row == seat.row && s.seat == seat.seat)
            .toList();
    if (existingSeat.isNotEmpty) {
      selectedSeats.removeWhere(
        (s) => s.row == seat.row && s.seat == seat.seat,
      );
    } else {
      selectedSeats.add(seat);
    }
    setState(() {});
  }
}
