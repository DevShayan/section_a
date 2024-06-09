import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/schedule/sch_state.dart';
import 'package:section_a/constants/functions.dart';
import 'package:section_a/pojos/schedule.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleState()) {
    on<ScheduleEvent>((event, emit) => ScheduleState.fromState(state));
  }


  void updateCurrIndex() {
    int currHour = changeHourFormat(DateTime.now().hour);
    int currMin = DateTime.now().minute;

    if (Schedules.list[DateTime.now().weekday-1].isEmpty) {
      return;
    }

    if ((currHour == 8 && currMin >= 30) || currHour == 9) {
      state.currIndex =  0;
      state.timeRemaining = Schedules.list[DateTime.now().weekday-1][0].endTime.difference(changeHourDate(DateTime.now()));
    }
    else if (currHour == 10 || (currHour == 11 && currMin < 30)) {
      state.currIndex =  1;
      state.timeRemaining = Schedules.list[DateTime.now().weekday-1][1].endTime.difference(changeHourDate(DateTime.now()));
    }
    else if ((currHour == 11 && currMin >= 30) || currHour == 12) {
      state.currIndex =  2;
      state.timeRemaining = Schedules.list[DateTime.now().weekday-1][2].endTime.difference(changeHourDate(DateTime.now()));
    }
    else if (currHour == 1 || (currHour == 2 && currMin < 30)) {
      state.currIndex =  3;
      state.timeRemaining = Schedules.list[DateTime.now().weekday-1][3].endTime.difference(changeHourDate(DateTime.now()));
    }
    else if ((currHour == 2 && currMin >= 30) || currHour == 3) {
      state.currIndex =  4;
      state.timeRemaining = Schedules.list[DateTime.now().weekday-1][4].endTime.difference(changeHourDate(DateTime.now()));
      printLog("debug");
    }
    else {
      state.currIndex =  -1;
    }
    timeChanged();
  }

  String durationToString() {
    int hours = state.timeRemaining.inHours;
    int minutes = state.timeRemaining.inMinutes.remainder(60).toInt();

    if (minutes == 60) {
      hours++;
      minutes = 1;
    } else {
      minutes++;
    }

    if (hours == 0) {
      return "$minutes mins remaining";
    }
    return "$hours hrs $minutes mins remaining";
  }

  void timeChanged() {
    add(ScheduleEvent());
  }


  int changeHourFormat(int hour) {
    switch (hour) {
      case 0: return 12;
      case 13: return 1;
      case 14: return 2;
      case 15: return 3;
      case 16: return 4;
      case 17: return 5;
      case 18: return 6;
      case 19: return 7;
      case 20: return 8;
      case 21: return 9;
      case 22: return 10;
      case 23: return 11;
      default: return hour;
    }
  }

  DateTime changeHourDate(DateTime time) {
    switch (time.hour) {
      case 0: return DateTime(time.year, time.month, time.day, 12, time.minute, time.second);
      case 13: return DateTime(time.year, time.month, time.day, 1, time.minute, time.second);
      case 14: return DateTime(time.year, time.month, time.day, 2, time.minute, time.second);
      case 15: return DateTime(time.year, time.month, time.day, 3, time.minute, time.second);
      case 16: return DateTime(time.year, time.month, time.day, 4, time.minute, time.second);
      case 17: return DateTime(time.year, time.month, time.day, 5, time.minute, time.second);
      case 18: return DateTime(time.year, time.month, time.day, 6, time.minute, time.second);
      case 19: return DateTime(time.year, time.month, time.day, 7, time.minute, time.second);
      case 20: return DateTime(time.year, time.month, time.day, 8, time.minute, time.second);
      case 21: return DateTime(time.year, time.month, time.day, 9, time.minute, time.second);
      case 22: return DateTime(time.year, time.month, time.day, 10, time.minute, time.second);
      case 23: return DateTime(time.year, time.month, time.day, 11, time.minute, time.second);
      default: return time;
    }
  }
}