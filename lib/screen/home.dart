import 'package:flutter/material.dart';
import 'package:repeated_habit_tracker/util/constants.dart';
import 'package:repeated_habit_tracker/widget/habit_creator.dart';

import 'package:repeated_habit_tracker/widget/welcome_back_messsage.dart';
import 'package:repeated_habit_tracker/widget/habit_heat_map.dart';
import 'package:repeated_habit_tracker/widget/habit_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List habitList = [
    ['Drink Water', false],
  ];

  void checkboxChange(bool? value, int index) {
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });
  }

  final textController = TextEditingController();

  void addHabit() {
    showDialog(context: context, builder: (context) {
      return HabitCreator(
        saveTap: saveTask,
        controller: textController);
    });
  }

  void saveTask() {
    setState(() {
      habitList.add([textController.text, false]);
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
              itemCount: habitList.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habitName: habitList[index][0],
                  isChecked: habitList[index][1], 
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