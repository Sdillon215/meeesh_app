import 'package:flutter/material.dart';
import 'dart:math';

// * Basic State Management Via Inherited Whhhhidget * //
class AppState {
  AppState({
    required this.pageIndex,
  });

  var pageIndex = 0;
  AppState copyWith({
    pageIndex,
  }) {
    return AppState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}

class AppStateScope extends InheritedWidget {
  const AppStateScope(this.data, {Key? key, required Widget child})
      : super(key: key, child: child);

  final AppState data;

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data != oldWidget.data;
  }
}

class AppStateWidget extends StatefulWidget {
  const AppStateWidget({required this.child, Key? key}) : super(key: key);

  final Widget child;

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState _data = AppState(
    pageIndex: 0,
  );

  void setPageIndex(selectedIndex) {
    if (selectedIndex != _data.pageIndex) {
      setState(() {
        _data = _data.copyWith(
          pageIndex: selectedIndex,
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      _data,
      child: widget.child,
    );
  }
}
