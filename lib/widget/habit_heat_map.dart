import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HabitHeatMap extends StatefulWidget {
  const HabitHeatMap({super.key});

  @override
  State<HabitHeatMap> createState() => _HabitHeatMapState();
}

class _HabitHeatMapState extends State<HabitHeatMap> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: HeatMapCalendar(
        defaultColor: Colors.white,
        flexible: false,
        colorMode: ColorMode.color,
        showColorTip: false,
        datasets: {
          DateTime(2026, 1, 1): 3,
          DateTime(2021, 1, 7): 7,
          DateTime(2021, 1, 8): 10,
          DateTime(2021, 1, 9): 13,
          DateTime(2021, 1, 13): 6,
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
