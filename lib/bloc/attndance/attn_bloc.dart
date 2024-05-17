import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/attndance/attn_event.dart';
import 'package:section_a/bloc/attndance/attn_state.dart';
import 'package:section_a/routes/routes.dart';

class AttndanceScreenBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttndanceScreenBloc() : super(AttendanceState()) {

    on((event, emit) => emit(AttendanceState.fromState(state)));
  }

  void onTapCard(BuildContext context, int index) {
    switch (index) {
      case 0: Navigator.of(context).pushNamed(AppRoutes.subjAttn, arguments: 0); break;
      case 1: Navigator.of(context).pushNamed(AppRoutes.subjAttn, arguments: 1); break;
      case 2: Navigator.of(context).pushNamed(AppRoutes.subjAttn, arguments: 2); break;
      case 3: Navigator.of(context).pushNamed(AppRoutes.subjAttn, arguments: 3); break;
      case 4: Navigator.of(context).pushNamed(AppRoutes.subjAttn, arguments: 4); break;
    }
    
  }
}