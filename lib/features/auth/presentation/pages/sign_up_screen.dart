import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_time/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movie_time/features/auth/presentation/bloc/auth_event.dart';
import 'package:movie_time/features/auth/presentation/bloc/auth_state.dart';
import 'package:movie_time/features/auth/presentation/pages/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  double height = 0, width = 0;
  bool isObscured = true;

  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final authBloc = AuthBloc();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => authBloc,
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: const Color.fromRGBO(18, 18, 18, 1),
          padding: const EdgeInsets.only(top: 210, left: 16, right: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
                const SizedBox(height: 50),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: _emailController,
                      cursorColor: const Color.fromRGBO(50, 168, 115, 1),
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromRGBO(50, 168, 115, 1)),
                      decoration: InputDecoration(
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                        )),
                        errorText: state is AuthFailureState
                            ? state.emailErrorMessage
                            : null,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(50, 168, 115, 1))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "name@example.com",
                        hintStyle: const TextStyle(
                            fontSize: 18, color: Color.fromRGBO(50, 168, 115, 1)),
                        labelText: "Email",
                        labelStyle: const TextStyle(
                            fontSize: 18, color: Color.fromRGBO(50, 168, 115, 1)),
                        prefixIcon: const Icon(
                          size: 30,
                          Icons.email,
                          color: Color.fromRGBO(50, 168, 115, 1),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                    );
                  },
                ),
                const SizedBox(height: 30),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: _usernameController,
                      cursorColor: const Color.fromRGBO(50, 168, 115, 1),
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromRGBO(50, 168, 115, 1)),
                      decoration: InputDecoration(
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                        )),
                        errorText: state is AuthFailureState
                            ? state.usernameErrorMessage
                            : null,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(50, 168, 115, 1))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Max",
                        hintStyle: const TextStyle(
                            fontSize: 18, color: Color.fromRGBO(50, 168, 115, 1)),
                        labelText: "Username",
                        labelStyle: const TextStyle(
                            fontSize: 18, color: Color.fromRGBO(50, 168, 115, 1)),
                        prefixIcon: const Icon(
                          size: 30,
                          Icons.person,
                          color: Color.fromRGBO(50, 168, 115, 1),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    );
                  },
                ),
                const SizedBox(height: 30),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: isObscured,
                      cursorColor: const Color.fromRGBO(50, 168, 115, 1),
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromRGBO(50, 168, 115, 1)),
                      decoration: InputDecoration(
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                        )),
                        errorText: state is AuthFailureState
                            ? state.passwordErrorMessage
                            : null,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(50, 168, 115, 1))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(50, 168, 115, 1)),
                          prefixIcon: const Icon(
                            size: 30,
                            Icons.lock,
                            color: Color.fromRGBO(50, 168, 115, 1),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscured = !isObscured;
                                });
                              },
                              icon: isObscured
                                  ? const Icon(
                                      size: 30,
                                      Icons.visibility,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      size: 30,
                                      Icons.visibility_off,
                                      color: Colors.white,
                                    ))),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    );
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                    height: 50,
                    width: width,
                    child: ElevatedButton(
                        onPressed: () {
                          authBloc.add(
                            CreateAccountButtonClickEvent(
                              email: _emailController.text.trim(),
                              username: _usernameController.text.trim(),
                              password: _passwordController.text.trim(),
                              context: context
                            )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(50, 168, 115, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ))),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 6),
                    InkWell(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()))
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(149, 172, 255, 1),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
