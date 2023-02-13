import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget_notes_app/HomePage.dart';
import 'package:flutter_inherited_widget_notes_app/MyInheritedWidget.dart';
import 'package:flutter_inherited_widget_notes_app/Tasks.dart';

class AllNotesWidgetRecord extends StatefulWidget {
  const AllNotesWidgetRecord({super.key});
  @override
  State<AllNotesWidgetRecord> createState() => _AllNotesWidgetRecordState();
}

class _AllNotesWidgetRecordState extends State<AllNotesWidgetRecord> {
  late List<Tasks> notes;
  late List<MapEntry<String, List<Tasks>>> values;
  @override
  void didChangeDependencies() {
    notes = MyInheritedWidget.of(context).state.notesList;
    values =
        groupBy(notes, (Tasks details) => details.dateTime).entries.toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // notes = MyInheritedWidget.of(context).state.notesList;
    return Scaffold(
      backgroundColor: const Color(0xff5193B3).withOpacity(0.7),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          "All Tasks",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff5193B3).withOpacity(0.0),
        centerTitle: true,
      ),
      body: notes.isEmpty
          ? noTaskFound(context)
          : Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: values.length,
                      itemBuilder: (context, index) {
                        return ConstrainedBox(
                          constraints: BoxConstraints.loose(
                            const Size(double.infinity, double.infinity),
                          ),
                          child: buildItemRowView(
                            values: values,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/addTask");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildItemView({required Tasks notes}) {
    return Container(
      // padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white,
        // color: Colors.blueGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: notes.isCompleted == true
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                  )
                : const Icon(
                    Icons.circle_outlined,
                    color: Colors.lightBlue,
                  ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  // MyInheritedWidget.of(context).notesList[index].getTitle,
                  notes.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    // color: Color(0xff73A8C2),
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  notes.getTime,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      // color: Color(0xff73A8C2),
                      color: Colors.blue[400]),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                MyInheritedWidget.of(context).state.removeNote(notes);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.black.withOpacity(0.6),
              ))
          // GestureDetector(
          //   child: Icon(
          //     Icons.delete,
          //     color: Colors.blue[400],
          //     shadows: [
          //       BoxShadow(
          //         color: Colors.indigo.withOpacity(01),
          //         offset: const Offset(2, 2),
          //         blurRadius: 20,
          //       ),
          //     ],
          //   ),
          //   onTap: () {

          //   },
          // )
        ],
      ),
    );
  }

  Widget buildItemRowView(
      {required List<MapEntry<String, List<Tasks>>> values,
      required int index}) {
    List<Tasks> myNotes = values[index].value;
    return Container(
      // color: Colors.blue,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              values[index].key,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: values[index].value.length,
            itemBuilder: ((context, index) {
              return buildItemView(notes: myNotes[index]);
            }),
          ),
        ],
      ),
    );
  }
}
