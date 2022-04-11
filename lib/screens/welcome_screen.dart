import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:flutter_project/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = "welcome_screen";

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 30.0, fontFamily: 'Agne', color: Colors.black),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'FLASH CHAT',
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
          Hero(
            tag: "photo",
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  "images/main_image.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blueGrey,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blueGrey,
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
