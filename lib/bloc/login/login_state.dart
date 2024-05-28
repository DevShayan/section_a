class LoginScreenState {
  String misInput = "";
  bool isLoading = false;
  bool isLoginDisabled = false;

  LoginScreenState();
  LoginScreenState.fromState(LoginScreenState currState){
    misInput = currState.misInput;
    isLoading = currState.isLoading;
    isLoginDisabled = currState.isLoginDisabled;
  }
}

class LoginScreenEvent {}