import 'package:movie_time/features/auth/data/models/auth_model.dart';

abstract class AuthRepository {

  Future<AuthModel> login({
    required String email,
    required String password
  });

  Future<AuthModel> signUp({
    required String email,
    required String username,
    required String password
  });
  
} 