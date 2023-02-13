import 'package:flutter/widgets.dart';

class Tasks {
  bool isCompleted = false;
  String title;
  String time;
  String dateTime;
  Color notesColor;
  String taskDescription;
  int star;
  Tasks({
    required this.isCompleted,
    required this.time,
    required this.title,
    required this.dateTime,
    required this.star,
    required this.notesColor,
    required this.taskDescription,
  });
  String get getTitle => title;
  String get getTime => time;
  String get getDateTime => dateTime;
  Color get getNotesColor => notesColor;
  @override
  String toString() {
    return 'Title: $title\nTime: $time\nNotesColor: $notesColor\nComplete: $isCompleted';
  }
}
