import 'package:flutter/material.dart';
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
  final List<Habit> habitData = [];

  void checkboxChange(bool? value, int index) {
    setState(() {
      habitData[index].isChecked = !habitData[index].isChecked;
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
      habitData.add(Habit(textController.text, false));
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
              itemCount: habitData.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habitName: habitData[index].name,
                  isChecked: habitData[index].isChecked, 
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