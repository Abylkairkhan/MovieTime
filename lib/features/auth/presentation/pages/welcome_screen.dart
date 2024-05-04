import 'package:flutter/material.dart';
import 'package:movie_time/features/auth/presentation/pages/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return WelcomeScreenState();
  }
  
}

class WelcomeScreenState extends State<WelcomeScreen> {

  double height = 0, width = 0;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/WelcomeBackground.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: height - 310,
            height: height / 2,
            width: width,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(18,18,18,0.7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
              child: Column(
                children: [
                  const Text(
                    "Watch movies anytime anywhere",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Explore a vast collection of blockbuster movies, timeless classics, and the latest releases.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen()
                        )
                      );
                    }, 
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(330, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)
                      ),
                      side: const BorderSide(color: Color.fromRGBO(50, 168, 115, 1), width: 2),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color.fromRGBO(50, 168, 115, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    )
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}


