import 'package:flutter/material.dart';
import 'package:repeated_habit_tracker/screen/home.dart';
import 'package:repeated_habit_tracker/util/default_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox("Habit_Database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: DefaultTheme.lightMode,
      darkTheme: DefaultTheme.darkMode,
      themeMode: ThemeMode.system,
    );
  }
}