import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:repeated_habit_tracker/data/habit_database.dart';
import 'package:repeated_habit_tracker/util/constants.dart';
import 'package:repeated_habit_tracker/widget/habit_creator.dart';

import 'package:repeated_habit_tracker/model/habit.dart';

import 'package:repeated_habit_tracker/widget/welcome_back_messsage.dart';
import 'package:repeated_habit_tracker/widget/habit_heat_map.dart';
import 'package:repeated_habit_tracker/widget/habit_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }

    else {
      db.loadData();
    }

    db.updateDatabase();

    super.initState();
  }

  void checkboxChange(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index].isChecked = value!;
    });
  }

  final textController = TextEditingController();

  void addHabit() {
    showDialog(context: context, builder: (context) {
      return HabitCreator(
        saveTap: saveTask,
        controller: textController,
      );
    });
  }

  void saveTask() {
    setState(() {
      db.todaysHabitList.add(Habit(textController.text, false));
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        toolbarHeight: kToolbarsHeight,
        centerTitle: kCenterTitle,
        titleSpacing: kTitleSpacing,
        title: WelcomeBackMesssage(userName: 'Dimitrios'),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: HabitHeatMap(),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30, left: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Today's Habits",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                )),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: db.todaysHabitList.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habitName: db.todaysHabitList[index].name,
                  isChecked: db.todaysHabitList[index].isChecked, 
                  onChanged: (value) => checkboxChange(value, index),
                );
              },
            ),
          ),

        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addHabit,
        child: Icon(Icons.add),
      ),
    );
  }
}