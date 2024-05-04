abstract class AuthState{}

class AuthInitialState extends AuthState {}

class AuthSucessState extends AuthState {}

class AuthFailureState extends AuthState {

  final String? emailErrorMessage;
  final String? usernameErrorMessage;
  final String? passwordErrorMessage;

  AuthFailureState({
    required this.emailErrorMessage, 
    required this.usernameErrorMessage, 
    required this.passwordErrorMessage
  });

}