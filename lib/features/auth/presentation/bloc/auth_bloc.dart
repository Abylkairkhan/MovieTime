import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_time/features/auth/data/repository/auth_repository_impl.dart';
import 'package:movie_time/features/auth/domain/repository/auth_repository.dart';
import 'package:movie_time/features/auth/domain/usecases/email_validation.dart';
import 'package:movie_time/features/auth/domain/usecases/password_validation.dart';
import 'package:movie_time/features/auth/domain/usecases/username_validation.dart';
import 'package:movie_time/features/auth/presentation/bloc/auth_event.dart';
import 'package:movie_time/features/auth/presentation/bloc/auth_state.dart';
import 'package:movie_time/features/auth/presentation/pages/sign_up_screen.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthRepository authRepository = AuthRepositoryImpl();

  AuthBloc(): super(AuthInitialState()) {

    on<LoginButtonClickEvent>(_onLoginButtonClickEvent);
    on<SignUpTextClickEvent>(_onSignUpTextClickEvent);
    on<CreateAccountButtonClickEvent>(_onCreateAccountButtonClickEvent);

  }
  
  _onCreateAccountButtonClickEvent(
    CreateAccountButtonClickEvent event,
    Emitter<AuthState> emit
  ) async {

    String? emailValidationResut = emailValidationUseCase(event.email);
    String? usernameValidationResut = usernameValidationUseCase(event.username);
    String? passwordValidationResult = passwordValidationUseCase(event.password);

    if(emailValidationResut == null && usernameValidationResut == null && passwordValidationResult == null) {
      final response = await authRepository.signUp(email: event.email, username: event.username, password: event.password);
      if (response.success) {
      } else {
        return emit(AuthFailureState(
            emailErrorMessage: null, 
            usernameErrorMessage: null,
            passwordErrorMessage: response.message
          )
        );
      }
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
  ) async {

    String? emailValidationResut = emailValidationUseCase(event.email);
    String? passwordValidationResult = passwordValidationUseCase(event.password);

    if(emailValidationResut == null && passwordValidationResult == null) {
      final response = await authRepository.login(email: event.email, password: event.password);
      if (response.success) {
        var context = event.context;
        Navigator.push(context,MaterialPageRoute(builder: (context) => const SignUpScreen()));
      } else {
        return emit(AuthFailureState(
            emailErrorMessage: null, 
            usernameErrorMessage: null,
            passwordErrorMessage: response.message
          )
        );
      }
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
    var context = event.context;
    Navigator.push(context,MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }
}