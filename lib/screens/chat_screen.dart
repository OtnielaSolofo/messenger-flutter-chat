import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static String id = "chat_screen";
  String textToSend = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          child: TextField(
            onChanged: (value) {
              // textToSend = value;
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            textToSend = "Blablabla Otni aa";
            FirebaseFirestore.instance.collection('messages').doc("testID").set(
                {'sender': 'solofootniela@gmail.com', 'text': 'Ca marche'});
          },
          child: Text(
            "Send message",
            style: TextStyle(color: Colors.green),
          ),
        ),
        /*StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("messages").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Text("There is no expense");
              }
              // return ListView(children: getExpenseItems(snapshot));
              return snapshot.hasData
                  ? Scaffold(
                      body: SafeArea(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 70, top: 16),
                        reverse: false,
                        itemCount: snapshot.data!.docs.length, // error
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          var data = ds.data() as Map;
                          String sender = data["sender"];
                          String text = data["text"];
                          return Text(sender + "\n" + text + "\n\n");
                        },
                      ),
                    ))
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            })*/
      ],
    );
  }
}
