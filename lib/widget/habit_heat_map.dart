import 'package:flutter/material.dart';

class HabitHeatMap extends StatefulWidget {
  const HabitHeatMap({super.key});

  @override
  State<HabitHeatMap> createState() => _HabitHeatMapState();
}

class _HabitHeatMapState extends State<HabitHeatMap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Habits completed today: 0')),
          Placeholder(fallbackHeight: 250),
        ],
      ),
    );
  }
}
