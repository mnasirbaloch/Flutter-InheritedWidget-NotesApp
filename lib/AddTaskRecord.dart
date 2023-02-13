import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget_notes_app/MyInheritedWidget.dart';
import 'package:flutter_inherited_widget_notes_app/Tasks.dart';

class AddTaskRecord extends StatefulWidget {
  const AddTaskRecord({super.key});

  @override
  State<AddTaskRecord> createState() => _AddTaskRecordState();
}

class _AddTaskRecordState extends State<AddTaskRecord> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  TimeOfDay? timeOfDay;
  String? startTime;
  String? endTime;
  String? year;
  String? month;
  String? day;
  String? date;
  @override
  void initState() {
    timeOfDay = TimeOfDay.now();
    startTime =
        '${timeOfDay!.hour.toString().length == 1 ? '0${timeOfDay!.hour}' : timeOfDay!.hour} : ${timeOfDay!.hour.toString().length == 1 ? '0${timeOfDay!.minute}' : timeOfDay!.minute}';
    endTime =
        '${timeOfDay!.hour.toString().length == 1 ? '0${timeOfDay!.hour}' : timeOfDay!.hour} : ${timeOfDay!.hour.toString().length == 1 ? '0${timeOfDay!.minute}' : timeOfDay!.minute}';

    date = 'Pick Date';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // backgroundColor: const Color(0xfffeedfa).withOpacity(1),
        // backgroundColor: Colors.white.withOpacity(0.1),
        backgroundColor: const Color(0xff5193B3).withOpacity(0.7),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        elevation: 0,
        title: const Text(
          "Add Task Info",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      // backgroundColor: const Color(0xfffeedfa).withOpacity(1),
      // backgroundColor: Colors.white.withOpacity(0.1),
      backgroundColor: const Color(0xff5193B3).withOpacity(0.7),
      body: myWidget(context),
    );
  }

// Main Widget of AddTaskReocrd
  Widget myWidget(BuildContext context) {
    return Container(
      // color: const Color(0xfffeedfa).withOpacity(0),
      // color: Colors.purple.withOpacity(0.3),
      color: const Color(0xff5193B3).withOpacity(0.7),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Material(
              elevation: 5,
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              // shadowColor: Colors.red,
              child: buildInputField(
                textEditingController: titleController,
                lable: "Task",
                isEnabled: true,
                iconData: Icons.book,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                      child: buildTimeField(
                          iconData: Icons.access_time,
                          label: "Start Time",
                          time: startTime!),
                    ),
                  ),
                  onTap: () {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((value) {
                      if (value != null) {
                        startTime =
                            '${value.hour.toString().length == 1 ? '0${value.hour}' : value.hour} : ${value.minute.toString().length == 1 ? '0${value.minute}' : value.minute}';

                        setState(() {});
                      }
                    });
                  },
                ),
              ),
              Flexible(
                child: GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                      child: buildTimeField(
                          iconData: Icons.access_time,
                          label: "End Time",
                          time: endTime!),
                    ),
                  ),
                  onTap: () {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((value) {
                      endTime =
                          '${value!.hour.toString().length == 1 ? '0${value.hour}' : value.hour} : ${value.minute.toString().length == 1 ? '0${value.minute}' : value.minute}';
                      setState(() {});
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Material(
                elevation: 5,
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                // shadowColor: Colors.red,
                child: buildInputField(
                    textEditingController: dateController,
                    lable: date.toString(),
                    isEnabled: false,
                    iconData: Icons.edit_calendar_sharp),
              ),
            ),
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime(2023, 02, 01),
                      firstDate: DateTime(2023, 02, 01),
                      lastDate: DateTime(2023, 02, 28))
                  .then((value) {
                if (value != null) {
                  date =
                      '${value.day.toString().length == 1 ? '0${value.day}' : value.day}-${value.month.toString().length == 1 ? '0${value.month}' : value.month}-${value.year}  ';
                  year = value.year.toString();
                  month =
                      '${value.month.toString().length == 1 ? '0${value.month}' : value.month}';
                  day =
                      '${value.day.toString().length == 1 ? '0${value.day}' : value.day}';
                  setState(
                    () {},
                  );
                }
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Material(
              elevation: 5,
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              // shadowColor: Colors.red,

              child: buildDescriptionField(
                  textEditingController: descriptionController,
                  lable: "Task Description",
                  isEnabled: true),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => 0),
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue),
              ),
              onPressed: () {
                MyInheritedWidget.of(context).state.addNote(
                      Tasks(
                        isCompleted: false,
                        time: '$startTime - $endTime',
                        title: titleController.text,
                        dateTime: date!,
                        star: 1,
                        notesColor: Colors.red,
                        taskDescription: descriptionController.text,
                      ),
                    );

                Navigator.of(context).pop();
              },
              child: Container(
                // color: Colors.black,
                padding: const EdgeInsets.all(10),
                child: const Text("Add Task"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(
      {required IconData iconData,
      required TextEditingController textEditingController,
      required String lable,
      required bool isEnabled}) {
    return Container(
      decoration: const BoxDecoration(
        // color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            iconData,
            size: 30,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
                controller: textEditingController,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  enabled: isEnabled,
                  border: InputBorder.none,
                  label: Text(
                    lable,
                    style: const TextStyle(fontSize: 13),
                  ),
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                )),
          )
        ],
      ),
    );
  }

  Widget buildDescriptionField(
      {required TextEditingController textEditingController,
      required String lable,
      required bool isEnabled}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      margin: const EdgeInsets.all(5),
      child: Row(children: [
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            maxLines: 3,
            minLines: 1,
            controller: textEditingController,
            style: TextStyle(
              color: !isEnabled ? Colors.blue : Colors.black.withOpacity(0.8),
            ),
            decoration: InputDecoration(
              enabled: isEnabled,
              border: InputBorder.none,
              label: Text(lable),
              labelStyle: TextStyle(
                textBaseline: TextBaseline.alphabetic,
                fontWeight: FontWeight.bold,
                color: !isEnabled ? Colors.black : Colors.blue,
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget buildTimeField(
      {required IconData iconData,
      required String label,
      required String time}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(
        top: 5,
        left: 5,
        bottom: 5,
        right: 0,
      ),
      // padding: const EdgeInsets.only(
      //   left: 0,
      //   right: 10,
      //   top: 10,
      //   bottom: 10,
      // ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  time,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.blue,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Future<TimeOfDay?> showTimePicker({
  required BuildContext context,
  required TimeOfDay initialTime,
  TransitionBuilder? builder,
  bool useRootNavigator = true,
  TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
  String? cancelText,
  String? confirmText,
  String? helpText,
  String? errorInvalidText,
  String? hourLabelText,
  String? minuteLabelText,
  RouteSettings? routeSettings,
  EntryModeChangeCallback? onEntryModeChanged,
  Offset? anchorPoint,
}) async {
  assert(context != null);
  assert(initialTime != null);
  assert(useRootNavigator != null);
  assert(initialEntryMode != null);
  assert(debugCheckHasMaterialLocalizations(context));

  final Widget dialog = TimePickerDialog(
    initialTime: initialTime,
    initialEntryMode: initialEntryMode,
    cancelText: cancelText,
    confirmText: confirmText,
    helpText: helpText,
    errorInvalidText: errorInvalidText,
    hourLabelText: hourLabelText,
    minuteLabelText: minuteLabelText,
    onEntryModeChanged: onEntryModeChanged,
  );
  return showDialog<TimeOfDay>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
  );
}

Future<DateTime?> showDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? currentDate,
  DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  SelectableDayPredicate? selectableDayPredicate,
  String? helpText,
  String? cancelText,
  String? confirmText,
  Locale? locale,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  DatePickerMode initialDatePickerMode = DatePickerMode.day,
  String? errorFormatText,
  String? errorInvalidText,
  String? fieldHintText,
  String? fieldLabelText,
  TextInputType? keyboardType,
  Offset? anchorPoint,
}) async {
  assert(context != null);
  assert(initialDate != null);
  assert(firstDate != null);
  assert(lastDate != null);
  initialDate = DateUtils.dateOnly(initialDate);
  firstDate = DateUtils.dateOnly(firstDate);
  lastDate = DateUtils.dateOnly(lastDate);
  assert(
    !lastDate.isBefore(firstDate),
    'lastDate $lastDate must be on or after firstDate $firstDate.',
  );
  assert(
    !initialDate.isBefore(firstDate),
    'initialDate $initialDate must be on or after firstDate $firstDate.',
  );
  assert(
    !initialDate.isAfter(lastDate),
    'initialDate $initialDate must be on or before lastDate $lastDate.',
  );
  assert(
    selectableDayPredicate == null || selectableDayPredicate(initialDate),
    'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
  );
  assert(initialEntryMode != null);
  assert(useRootNavigator != null);
  assert(initialDatePickerMode != null);
  assert(debugCheckHasMaterialLocalizations(context));

  Widget dialog = DatePickerDialog(
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    currentDate: currentDate,
    initialEntryMode: initialEntryMode,
    selectableDayPredicate: selectableDayPredicate,
    helpText: helpText,
    cancelText: cancelText,
    confirmText: confirmText,
    initialCalendarMode: initialDatePickerMode,
    errorFormatText: errorFormatText,
    errorInvalidText: errorInvalidText,
    fieldHintText: fieldHintText,
    fieldLabelText: fieldLabelText,
    keyboardType: keyboardType,
  );

  if (textDirection != null) {
    dialog = Directionality(
      textDirection: textDirection,
      child: dialog,
    );
  }

  if (locale != null) {
    dialog = Localizations.override(
      context: context,
      locale: locale,
      child: dialog,
    );
  }

  return showDialog<DateTime>(
    context: context,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    anchorPoint: anchorPoint,
  );
}
