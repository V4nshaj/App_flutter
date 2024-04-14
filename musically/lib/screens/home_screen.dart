import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:musically/components/notification_service.dart';
import 'package:musically/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:musically/components/Nmethod.dart';
import 'package:musically/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musically/components/text_design.dart';
import 'package:musically/components/container_design.dart';

final _firestore = FirebaseFirestore.instance;
User? logedinuser;
var MyName;

class HomeScreen extends StatefulWidget {
  HomeScreen();

  static const String id = 'Home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isNotification = false;
  void toggleNotification() {
    setState(() {
      isNotification = !isNotification;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality

                // msgStream();
                // _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, SplashScreen.id, (Route<dynamic> route) => false);
              }),
        ],
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              width: 30.0,
              height: 30.0,
            ),
            Text('Musically'),
          ],
        ),
        backgroundColor: Colors.purple.withOpacity(0.1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Heading1('Welcome'),
                SizedBox(
                  width: 175.0,
                ),
                IconButton(
                  icon: Icon(
                    isNotification
                        ? Icons.notifications_active_rounded
                        : Icons.notifications_none_rounded,
                    size: 25,
                  ),
                  onPressed: toggleNotification,
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.gear_alt_fill,
                    // color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Divider(
              color: Colors.purpleAccent.shade100,
              thickness: 1, // Adjust thickness as needed
              indent: 20, // Adjust indent as needed
              endIndent: 20, // Adjust endIndent as needed
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                heading2('Popular'),
                SizedBox(width: 275.0),
                more_text(),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                popular_container(
                    'Popular', 'The Weekend', 'images/popular_img1.png'),
                popular_container(
                    'Family Affair', 'Blige', 'images/popular_img2.png'),
                popular_container(
                    'Rap God', 'Eminem', 'images/popular_img3.png'),
                popular_container(
                    'Mask off', 'Future', 'images/popular_img4.png'),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                heading2("New's"),
                SizedBox(width: 215.0),
                more_text(),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            News_container('Live nation, Warner Music and Coldplay...',
                'Writer: Hamidreza_p', 'images/news_img1.png'),
            News_container('Apple Music Live Tees Up SZA Ahead of ....',
                'Writer: James May', 'images/news_img2.png'),
            News_container("BMG Says a 'Single Project' Can Involv ....",
                'Writer: User32350', 'images/news_img3.png'),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                heading2('Music Genres'),
                SizedBox(
                  width: 215.0,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                genre_text('Rock'),
                genre_text('Pop Music'),
                genre_text('Country Music'),
                genre_text('Electronic Music'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                genre_text('Jazz'),
                genre_text('Blues'),
                genre_text('Funk'),
                genre_text('Polka'),
                genre_text('Heavily Metal'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                heading2('Famous Singers'),
                SizedBox(width: 200.0),
                more_text(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                famous_container('Eminem', 'images/famous_img1.png'),
                famous_container('Ed Shreen', 'images/famous_img2.png'),
                famous_container('Talor Swift', 'images/famous_img3.png'),
                famous_container('Hans Zimmer', 'images/famous_img4.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
