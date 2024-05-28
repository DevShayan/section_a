import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/schedule/sch_state.dart';
import 'package:section_a/pojos/schedule.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleState()) {
    on<ScheduleEvent>((event, emit) => ScheduleState.fromState(state));
  }

  void updateCurrIndex() {
    int currHour = DateTime.now().hour;
    int currMin = DateTime.now().minute;

    if ((currHour == 8 && currMin >= 30) || currHour == 9) {
      state.currIndex =  0;
      state.timeRemaining = Schedules.list[1].startTime.difference(DateTime.now());
    }
    else if (currHour == 10 || (currHour == 11 && currMin < 30)) {
      state.currIndex =  1;
      state.timeRemaining = Schedules.list[2].startTime.difference(DateTime.now());
    }
    else if ((currHour == 11 && currMin >= 30) || currHour == 12) {
      state.currIndex =  2;
      state.timeRemaining = Schedules.list[3].startTime.difference(DateTime.now());
    }
    else if (currHour == 1 || (currHour == 2 && currMin < 30)) {
      state.currIndex =  3;
      state.timeRemaining = Schedules.list[4].startTime.difference(DateTime.now());
    }
    else if ((currHour == 2 && currMin >= 30) || currHour == 3) {
      state.currIndex =  4;
      state.timeRemaining = Schedules.list[5].startTime.difference(DateTime.now());
    }
    else if (currHour == 4 || (currHour == 5 && currMin < 30)) {
      state.currIndex =  5;
      state.timeRemaining = Schedules.list[6].startTime.difference(DateTime.now());
    }
    else if ((currHour == 5 && currMin >= 30) || currHour == 6) {
      state.currIndex =  6;
      state.timeRemaining = Schedules.list[7].startTime.difference(DateTime.now());
    }
    else if (currHour == 7 || (currHour == 8 && currMin < 30)) {
      state.currIndex =  7;
      state.timeRemaining = Schedules.list[8].startTime.difference(DateTime.now());
    }
    else if ((currHour == 8 && currMin >= 30) || currHour == 9) {
      state.currIndex =  8;
      state.timeRemaining = Schedules.list[9].startTime.difference(DateTime.now());
    }
    else {
      state.currIndex =  -1;
    }
    timeChanged();
  }

  String durationToString() {
    int hours = state.timeRemaining.inHours;
    int minutes = state.timeRemaining.inMinutes;

    if (hours == 0) {
      return "$minutes mins remaining";
    }
    return "$hours hrs $minutes mins remaining";
  }

  void timeChanged() {
    add(ScheduleEvent());
  }
}