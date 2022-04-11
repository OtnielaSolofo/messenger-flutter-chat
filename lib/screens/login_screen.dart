import 'package:flutter/material.dart';
import 'package:flutter_project/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  static String id = "login_screen";

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                  String email_ = email.toString().trim();
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email_, password: password);

                  if (userCredential != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 30),
                height: 30,
                width: 150,
                child: Text("LOGIN"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
