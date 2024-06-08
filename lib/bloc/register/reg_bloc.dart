import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/register/reg_state.dart';
import 'package:section_a/constants/functions.dart';
import 'package:section_a/database/dummy_api.dart';
import 'package:section_a/pojos/curr_user.dart';
import 'package:section_a/routes/routes.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<RegisterEvent>((event, emit) => RegisterState.fromState(state));
  }

  void updateName(String currName) {
    CurrUser.name = currName;
  }

  void updateMis(String currMis) {
    CurrUser.misId = int.parse(currMis);
  }
  
  void onRegisterPress(BuildContext context) {
    printLog("OK");
    DummyAPI.fetchTotalAttnInUserAttndance();
    DummyAPI.fetchTotalGradesInUserGrades();

    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }
}
