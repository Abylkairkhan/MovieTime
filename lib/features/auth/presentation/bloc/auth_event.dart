import 'package:flutter/material.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class CreateAccountButtonClickEvent extends AuthEvent {

  final String email;
  final String username;
  final String password;
  final BuildContext context;

  const CreateAccountButtonClickEvent({
    required this.email, 
    required this.username, 
    required this.password,
    required this.context
  }); 
  
}

class LoginButtonClickEvent extends AuthEvent {

  final String email;
  final String password;
  final BuildContext context;

  const LoginButtonClickEvent({
    required this.email,
    required this.password,
    required this.context
  });

}

class LoginTextClickEvent extends AuthEvent {}

class SignUpTextClickEvent extends AuthEvent {
  final BuildContext context;

  const SignUpTextClickEvent({required this.context});
  
}