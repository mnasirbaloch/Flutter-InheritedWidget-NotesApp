import 'package:flutter/cupertino.dart';

import 'Tasks.dart';
import 'main.dart';

class MyInheritedWidget extends InheritedWidget {
  final Widget child;
  final List<Tasks> tasksList;
  final MyAppStateHandlerState state;
  final int count;
  const MyInheritedWidget(
      {super.key,
      required this.child,
      required this.tasksList,
      required this.count,
      required this.state})
      : super(child: child);

  // Off method which will return state of StateHandler
  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return count != oldWidget.count;
  }
}
