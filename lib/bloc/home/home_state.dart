class HomeScreenState {
  double? cgpa;
  double? attnP;
  bool assignmentsFetched = false;
  bool scheduleFetched = false;


  HomeScreenState();
  HomeScreenState.fromState(HomeScreenState currState){
    cgpa = currState.cgpa;
    attnP = currState.attnP;
    assignmentsFetched = currState.assignmentsFetched;
    scheduleFetched = currState.scheduleFetched;
  }
}

class HomeScreenEvent {}