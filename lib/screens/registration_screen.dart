import 'package:flutter/material.dart';
import 'package:flutter_project/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatelessWidget {
  static String id = "registration_screen";

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: "photo",
              child: Material(
                color: Colors.transparent,
                child: Image.asset(
                  "images/main_image.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
            ),
            GestureDetector(
              onTap: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password);

                  if (userCredential != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 30),
                height: 30,
                width: 150,
                child: Text("REGISTER"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
