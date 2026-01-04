import 'package:hive/hive.dart';

part 'habit.g.dart';

@HiveType(typeId: 0)
class Habit {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool isChecked;

  Habit(this.name, this.isChecked);
}
