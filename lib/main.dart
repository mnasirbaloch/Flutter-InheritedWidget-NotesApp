import 'package:flutter/material.dart';
import 'AddTaskRecord.dart';
import 'HomePage.dart';
import 'MyInheritedWidget.dart';
import 'NotesRecordWidget.dart';
import 'Tasks.dart';

void main() {
  runApp(const MyAppStateHandler());
}

class MyAppStateHandler extends StatefulWidget {
  const MyAppStateHandler({super.key});

  @override
  State<MyAppStateHandler> createState() => MyAppStateHandlerState();
}

class MyAppStateHandlerState extends State<MyAppStateHandler> {
  List<Tasks> notesList = [];
  late int itemCount;
  @override
  void initState() {
    itemCount = notesList.length;
    super.initState();
  }

  void addNote(Tasks note) {
    itemCount == 0 ? note.isCompleted = true : false;
    notesList.add(note);
    setState(() {
      itemCount++;
    });
  }

  void removeNote(Tasks note) {
    if (notesList.contains(note)) {
      notesList.remove(note);
      setState(() {
        itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      tasksList: notesList,
      count: itemCount,
      state: this,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        routes: {
          "/allTasksList": ((context) => const AllNotesWidgetRecord()),
          "/addTask": ((context) => const AddTaskRecord()),
        },
      ),
    );
  }
}
