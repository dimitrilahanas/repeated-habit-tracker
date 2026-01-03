import 'package:hive_flutter/hive_flutter.dart';
import 'package:repeated_habit_tracker/model/habit.dart';

final _myBox = Hive.box("Habit_database");

class HabitDatabase {
  List<Habit> todaysHabitList = [];

  void createDefaultData() {
    todaysHabitList = [
      Habit("Homework", false),
      Habit("Go for a run", false),
    ];
  }

  void loadData() {}

  void updateDatabase() {}
}