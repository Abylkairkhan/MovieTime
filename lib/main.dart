import 'package:flutter/material.dart';
import 'package:movie_time/features/auth/presentation/pages/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    const MaterialApp(
      title: "MovieTime",
      home: WelcomeScreen(),
    )
  );
}
