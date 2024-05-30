import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/home/home_state.dart';
import 'package:section_a/database/google_api.dart';
import 'package:section_a/pojos/attn.dart';
import 'package:section_a/pojos/curr_user.dart';
import 'package:section_a/pojos/grades.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState()) {
    
    on((event, emit) => emit(HomeScreenState.fromState(state)));
  }

  void fetchData() async {

    GoogleAPI.fetchAssignIntoAssignments()
    .then((bool value) {
      if (value) {
        state.assignmentsFetched = true;
        add(HomeScreenEvent());
      }
    });


    if (!GoogleAPI.attnFuncLock && UserAttendance.subjAttnList.isEmpty) {
      GoogleAPI.fetchTotalAttnInUserAttndance(CurrUser.uid)
      .then((value) {
        if (value) {
          state.attnP = UserAttendance.totalPercent;
          add(HomeScreenEvent());
        }
      });
    }

    if (!GoogleAPI.gradesFuncLock && UserGrades.gradesList.isEmpty) {
      GoogleAPI.fetchTotalGradesInUserGrades(CurrUser.uid)
      .then((bool value) {
        if (value) {
          state.cgpa = UserGrades.cgpa;
          add(HomeScreenEvent());
        }
      });
    }

    GoogleAPI.fetchClassSchedule()
    .then((value) {
      if (value) {
        state.scheduleFetched = true;
        add(HomeScreenEvent());
      }
    });

  }
}