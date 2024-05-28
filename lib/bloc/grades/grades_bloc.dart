import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/grades/grades_state.dart';
import 'package:section_a/routes/routes.dart';

class GradesBloc extends Bloc<GradesEvent, GradesState> {
  GradesBloc() : super(GradesState()) {

    on((event, emit) => emit(GradesState.fromState(state)));
  }

  void onTapSemCard(BuildContext context, int index) {
    switch (index) {
      case 0: Navigator.of(context).pushNamed(AppRoutes.semGrades, arguments: 0); break;
      case 1: Navigator.of(context).pushNamed(AppRoutes.semGrades, arguments: 1); break;
      case 2: Navigator.of(context).pushNamed(AppRoutes.semGrades, arguments: 2); break;
      case 3: Navigator.of(context).pushNamed(AppRoutes.semGrades, arguments: 3); break;
      case 4: Navigator.of(context).pushNamed(AppRoutes.semGrades, arguments: 4); break;
      case 5: Navigator.of(context).pushNamed(AppRoutes.semGrades, arguments: 5); break;
      case 6: Navigator.of(context).pushNamed(AppRoutes.semGrades, arguments: 6); break;
      case 7: Navigator.of(context).pushNamed(AppRoutes.semGrades, arguments: 7); break;
    }
    
  }
}