import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/login/login_event.dart';
import 'package:section_a/bloc/login/login_state.dart';
import 'package:section_a/database/google_api.dart';
import 'package:section_a/pojos/curr_user.dart';
import 'package:section_a/routes/routes.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenState()) {
    
    on((event, emit) => emit(LoginScreenState.fromState(state)));
  }

  void updateInput(String newInput) {
    state.misInput = newInput;
    add(LoginScreenEvent());
  }

  void login(BuildContext context) async {
    toggleLoginBtn();
    add(LoginScreenEvent());

    GoogleAPI.login(state.misInput)
    .then((success) {

      toggleLoginBtn();

      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("MIS not found!"),
          duration: const Duration(seconds: 5),
          action: SnackBarAction(label: "dismiss", onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
        ));
      }
      else {
        CurrUser.misId = int.parse(state.misInput);

        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }

    });

  }

  void toggleLoginBtn() {
    state.isLoading = !state.isLoading;
    state.isLoginDisabled = !state.isLoginDisabled;
    add(LoginScreenEvent());
  }
}