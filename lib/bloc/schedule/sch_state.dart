class ScheduleState {
  int currIndex = -1;
  Duration timeRemaining = const Duration(seconds: 0);

  ScheduleState();
  ScheduleState.fromState(ScheduleState state) {
    currIndex = state.currIndex;
    timeRemaining = state.timeRemaining;
  }
}


class ScheduleEvent {}