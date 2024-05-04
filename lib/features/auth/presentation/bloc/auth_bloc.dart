import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_time/features/auth/domain/usecases/email_validation.dart';
import 'package:movie_time/features/auth/domain/usecases/password_validation.dart';
import 'package:movie_time/features/auth/domain/usecases/username_validation.dart';
import 'package:movie_time/features/auth/presentation/bloc/auth_event.dart';
import 'package:movie_time/features/auth/presentation/bloc/auth_state.dart';
import 'package:movie_time/features/auth/presentation/pages/login_screen.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc(): super(AuthInitialState()) {

    on<LoginButtonClickEvent>(_onLoginButtonClickEvent);
    on<SignUpTextClickEvent>(_onSignUpTextClickEvent);
    on<CreateAccountButtonClickEvent>(_onCreateAccountButtonClickEvent);

  }
  
  _onCreateAccountButtonClickEvent(
    CreateAccountButtonClickEvent event,
    Emitter<AuthState> emit
  ) {

    String? emailValidationResut = emailValidationUseCase(event.email);
    String? usernameValidationResut = usernameValidationUseCase(event.username);
    String? passwordValidationResult = passwordValidationUseCase(event.password);

    if(emailValidationResut == null && usernameValidationResut == null && passwordValidationResult == null) {
      var context = event.context;
      Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
      return emit(AuthFailureState(
        emailErrorMessage: emailValidationResut, 
        usernameErrorMessage: usernameValidationResut,
        passwordErrorMessage: passwordValidationResult
        )
      );
    }
  }
  
  _onLoginButtonClickEvent(
    LoginButtonClickEvent event,
    Emitter<AuthState> emit
  ) {

    String? emailValidationResut = emailValidationUseCase(event.email);
    String? passwordValidationResult = passwordValidationUseCase(event.password);

    if(emailValidationResut == null && passwordValidationResult == null) {
      print("Navigate To HomeScreen");
      // var context = event.context;
      // Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      return emit(AuthFailureState(
        emailErrorMessage: emailValidationResut, 
        usernameErrorMessage: null,
        passwordErrorMessage: passwordValidationResult
        )
      );
    }
  }

  _onSignUpTextClickEvent(
    SignUpTextClickEvent event,
    Emitter<AuthState> emit
  ) {
    print("Navigate To SignUpScreen");
    // var context = event.context;
    // Navigator.push(context,MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }
}