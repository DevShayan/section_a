class HomeScreenState {
  double? cgpa;
  double? attnP;
  bool assignmentsFetched = false;


  HomeScreenState();
  HomeScreenState.fromState(HomeScreenState currState){
    cgpa = currState.cgpa;
    attnP = currState.attnP;
    assignmentsFetched = currState.assignmentsFetched;
  }
}