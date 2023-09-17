import 'dart:convert';

import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'Chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? messageText;
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  User? logedinuser;
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;

      if (user != null) {
        logedinuser = user;
        print(logedinuser);
      }
    } catch (e) {
      print(e);
    }
  }

/*
  void getMsg() async {//to get msg form cloud butt here we need to trigger or wait for the database to load
    final message = await _firestore.collection('Messages').get();
    for (var msg in message.docs) {
      print(msg.data());
    }
  }
  */
  void msgStream() async {
    //the snapshot enables to load the messages as soon as they are sent
    await for (var snapsot in _firestore.collection('Messages').snapshots()) {
      for (var msg in snapsot.docs) {
        print(msg.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                msgStream();
                // _auth.signOut();
                // Navigator.pushNamedAndRemoveUntil(
                //     context, WelcomeScreen.id, (Route<dynamic> route) => false);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //stream helps display snapshot of messages in column
            StreamBuilder<QuerySnapshot>(
              //declaring StreamBuilder as QuerySnapshot
              //alaways declare any function beforehand
              stream: _firestore.collection('Messages').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent),
                  );
                }
                final messages =
                    snapshot.data!.docs; //to access the data in async
                //async from steambuilder contains QuerySnapshot, QuerySnapshot contains document list
                List<Text> msgWidgets =
                    []; //List widget to hold the sender name and text
                for (var message1 in messages) {
                  var message = message1.data()
                      as Map<String, dynamic>; //typecasting object to String
                  //1st part is string and second part any data type
                  final messageText = message['text'];
                  final messageSender = message['sender'];
                  final msgWidget = Text('$messageText from $messageSender');
                  msgWidgets.add(msgWidget);
                }
                return Column(
                  children: msgWidgets,
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //Implement send functionality.
                      _firestore.collection('Messages').add({
                        //sends messages
                        'text': messageText,
                        'sender': logedinuser!.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
