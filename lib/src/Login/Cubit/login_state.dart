
// Define LoginState classes
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}