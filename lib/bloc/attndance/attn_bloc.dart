import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/attndance/attn_state.dart';
import 'package:section_a/routes/routes.dart';

class AttndanceScreenBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttndanceScreenBloc() : super(AttendanceState()) {

    on((event, emit) => emit(AttendanceState.fromState(state)));
  }

  void onTapCard(BuildContext context, int index) {
    Navigator.of(context).pushNamed(
      AppRoutes.subjAttn,
      arguments: index
    );
  }
}