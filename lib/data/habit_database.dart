import 'package:hive_flutter/hive_flutter.dart';
import 'package:repeated_habit_tracker/model/habit.dart';
import 'package:repeated_habit_tracker/util/datetime_format.dart';

late Box _myBox;

class HabitDatabase {
  final _myBox = Hive.box("Habit_Database");
  List<Habit> todaysHabitList = [];
  Map<DateTime, int> heatMapDataSet = {};

  String getTodayKey() {
    return hiveKeyForDate(DateTime.now());
  }

  void createDefaultData() {
    todaysHabitList = [Habit("Homework", false), Habit("Go for a run", false)];
  }

  void loadData() {
    final savedToday = _myBox.get(getTodayKey());

    if (savedToday != null) {
      todaysHabitList = (savedToday as List)
          .map((item) => item as Habit)
          .toList();
    } else {
      createDefaultData();
      updateDatabase();
    }
  }

  void updateDatabase() {
    _myBox.put(getTodayKey(), todaysHabitList);
  }

  void calculateCompleted() {
    int countComplete = 0;
    for (int i = 0; i < todaysHabitList.length; i++) {
      if (todaysHabitList[i].isChecked == true) {
        countComplete++;
      }
    }

    int percentageInt = todaysHabitList.isEmpty
        ? 0
        : ((countComplete / todaysHabitList.length) * 10).toInt();

    DateTime today = DateTime.now();
    DateTime normalizedDate = DateTime(today.year, today.month, today.day);

    heatMapDataSet[normalizedDate] = percentageInt;

    _myBox.put(
      "HEATMAP",
      heatMapDataSet.map((k, v) => MapEntry(k.toIso8601String(), v)),
    );

    updateDatabase();
  }

  void loadHeatMap() {
    final stored = _myBox.get("HEATMAP");

    if (stored != null) {
      (stored as Map).forEach((key, value) {
        final date = DateTime.parse(key.toString());
        final percentage = (value as num).toInt();
        heatMapDataSet[date] = percentage;
      });
    } else {
      final today = normalizeDate(DateTime.now());
      heatMapDataSet[today] = 0;
    }
  }
}
