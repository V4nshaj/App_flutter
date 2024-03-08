import 'dart:convert';

import 'package:aqua_trail/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:aqua_trail/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

final _firestore = FirebaseFirestore.instance;
User? logedinuser;

class ChatScreen extends StatefulWidget {
  final String user;
  ChatScreen({required this.user});

  static const String id = 'Chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  String? messageText;
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 191, 191),
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality

                // msgStream();
                _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, WelcomeScreen.id, (Route<dynamic> route) => false);
              }),
        ],
        title: Text('⚡️Water Level'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return //stream helps display snapshot of messages in column
        StreamBuilder(
      //declaring StreamBuilder as QuerySnapshot
      //alaways declare any function beforehand
      stream: ref.onValue,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent),
          );
        } else {
          Map<dynamic, dynamic> messages = snapshot.data!.snapshot.value
              as dynamic; //to access the data in async
          //async from steambuilder contains QuerySnapshot, QuerySnapshot contains document list
          var messageText;
          //typecasting object to String
          messageText = messages['data'];
          int level1 = messageText;
          int level = 1500;
          int consumption = level - level1;

          return Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2 - 100),
            //takes only the screen space
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Water Level left in Bottle: ' +
                      messageText.toString() +
                      ' ml',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Water consumed: ' + consumption.toString() + ' ml',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
