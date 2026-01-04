import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HabitHeatMap extends StatelessWidget {
  final Map<DateTime, int>? datasets;

  const HabitHeatMap({
    super.key,
    required this.datasets,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: HeatMapCalendar(
        defaultColor: Colors.white,
        flexible: false,
        colorMode: ColorMode.color,
        showColorTip: true,
        datasets: datasets,

        onClick: (DateTime value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You completed:'),
              duration: Duration(seconds: 3),
              ),
          );
        },

        colorsets: const {
          1: Color.fromARGB(20, 2, 179, 8),
          2: Color.fromARGB(40, 2, 179, 8),
          3: Color.fromARGB(60, 2, 179, 8),
          4: Color.fromARGB(80, 2, 179, 8),
          5: Color.fromARGB(100, 2, 179, 8),
          6: Color.fromARGB(120, 2, 179, 8),
          7: Color.fromARGB(140, 2, 179, 8),
          8: Color.fromARGB(160, 2, 179, 8),
          9: Color.fromARGB(180, 2, 179, 8),
          10: Color.fromARGB(200, 2, 179, 8),
        },
      ),
    );
  }
}
