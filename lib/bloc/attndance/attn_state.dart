import 'package:flutter/widgets.dart';

class AttendanceState {
  List<Widget> subjCards = [];

  AttendanceState();
  AttendanceState.fromState(AttendanceState currState) {
    subjCards = currState.subjCards;
  }
}

class AttendanceEvent {}