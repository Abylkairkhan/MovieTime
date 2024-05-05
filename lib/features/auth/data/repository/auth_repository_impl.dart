import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_time/features/auth/data/models/auth_model.dart';
import 'package:movie_time/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthModel> login({required String email, required String password}) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return const AuthModel(success: true, message: "Success");
    } on FirebaseAuthException catch(e) {
      if(e.code == 'user-not-found') {
        return const AuthModel(success: false, message: "No user found for that email");
      } else if (e.code == 'wrong-password') {
          return const AuthModel(success: false, message: "Wrong password provided for that user");
      } else if (e.code == 'invalid-credential') {
          return const AuthModel(success: false, message: "Invalid credential provided");
      }
    } catch(e) {
      return AuthModel(success: false, message: e.toString());
    }
    return const AuthModel(success: false, message: "Something goes wrong");
  }

  @override
  Future<AuthModel> signUp({required String email, required String username, required String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return const AuthModel(success: true, message: "Success");
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        return const AuthModel(success: false, message: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        return const AuthModel(success: false, message: "The account already exists for that email.");
      }
    } catch(e) {
      return AuthModel(success: false, message: e.toString());
    }
    return const AuthModel(success: false, message: "Something goes wrong");
  }
}