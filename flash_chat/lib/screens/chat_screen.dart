import 'dart:convert';

import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final messageTextController =
      TextEditingController(); //text controller helps to remove message from the typing screen after pressing the send button
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

/*
  void getMsg() async {//to get msg form cloud but here we need to trigger or wait for the database to load
    final message = await _firestore.collection('Messages').get();
    for (var msg in message.docs) {
      print(msg.data());
    }
  }
  */
  /*
  void msgStream() async {
    //the snapshot enables to load the messages as soon as they are sent
    await for (var snapsot in _firestore.collection('Messages').snapshots()) {
      for (var msg in snapsot.docs) {
        print(msg.data());
      }
    }
  }
*/
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

                // msgStream();
                _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, WelcomeScreen.id, (Route<dynamic> route) => false);
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
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController
                          .clear(); //clears the typing field after send is pressed
                      //Implement send functionality.
                      if (messageText != null) {
                        _firestore.collection('Messages').add({
                          //sends messages
                          'text': messageText,
                          'sender': logedinuser!.email,
                          'datetime': DateTime.now()
                              .millisecondsSinceEpoch //since 1 January 1970
                        });
                      }
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

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //stream helps display snapshot of messages in column
        StreamBuilder<QuerySnapshot>(
      //declaring StreamBuilder as QuerySnapshot
      //alaways declare any function beforehand
      stream: _firestore
          .collection('Messages')
          .orderBy('datetime', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent),
          );
        }
        final messages = snapshot.data!.docs; //to access the data in async
        //async from steambuilder contains QuerySnapshot, QuerySnapshot contains document list
        List<MessageBubble> messageBubbles =
            []; //List widget to hold the sender name and text
        for (var message1 in messages) {
          //reversed to add new message at the bottom
          var message = message1.data()
              as Map<String, dynamic>; //typecasting object to String
          message = message;
          //1st part is string and second part any data type
          final messageText = message['text'];
          final messageSender = message['sender'];
          final currentUser = logedinuser!.email;
          bool isMe = currentUser == messageSender;
          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isme: currentUser ==
                messageSender, //the message is from logged in user
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          //takes only the screen space
          child: ListView(
            reverse:
                true, //fixes the chat at bottom after sending the message to avoid scrolling
            //helps to display messages in scroll
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  //custom Text bubble

  MessageBubble({required this.sender, this.text, required this.isme});
  final String sender;
  final String? text;
  final bool isme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isme
                ? BorderRadius.only(
                    //to make round shaped the text
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    //to make round shaped the text
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isme ? Colors.lightBlueAccent : Colors.lightGreenAccent,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                '${text ?? 'No text'}', //if null then display
                style: TextStyle(
                    color: isme ? Colors.white : Colors.black54, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
