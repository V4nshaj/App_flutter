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
import 'package:musically/widget/purple_overlay.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import for time formatting

final _firestore = FirebaseFirestore.instance;
User? logedinuser;
var MyName;

class MusicScreen extends StatefulWidget {
  // final String user;
  MusicScreen();

  static const String id = 'Music_screen';

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  double _currentTime = 0;
  double _totalDuration = 100;

  bool isPlaying = false;
  bool isShuffleOn = false;
  bool isRepeatOn = false;
  bool isRepeatAll = true;

  String _formatDuration(Duration duration) {
    DateTime dateTime = DateTime(1970).add(duration);
    return DateFormat('m:ss').format(dateTime);
  }

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void toggleShuffle() {
    setState(() {
      isShuffleOn = !isShuffleOn;
    });
  }

  void toggleRepeat() {
    setState(() {
      if (isRepeatOn) {
        isRepeatOn = false;
        isRepeatAll = true; // Set repeat all on first press from repeat once
      } else if (isRepeatAll) {
        isRepeatAll = false;
      } else {
        isRepeatOn =
            true; // Set repeat once on first press from default or repeat all
      }
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.arrow_left_circle_fill,
                    color: Colors.grey,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
                Text(
                  "You're listening", //${MyName}
                  style: GoogleFonts.quintessential(
                    textStyle:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
                  ),
                  textAlign: TextAlign.start,
                ),
                IconButton(
                  icon: Icon(
                    Icons.pending_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 350.0,
              width: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Image.asset('images/music_img.png'),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Blinding Lights",
                      style: GoogleFonts.quintessential(
                        textStyle: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "The Weekend",
                      style: GoogleFonts.quintessential(
                        textStyle: TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.w600),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  width: 50.0,
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(isRepeatOn
                      ? Icons.repeat_one_rounded // Repeat once icon
                      : (isRepeatAll
                          ? Icons.repeat_rounded
                          : Icons.repeat_on_rounded)),
                  onPressed: toggleRepeat,
                ),
                IconButton(
                  icon: Icon(
                    Icons.skip_previous_rounded,
                    color: Colors.grey,
                    size: 50,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    isPlaying
                        ? CupertinoIcons.pause_circle_fill
                        : CupertinoIcons.play_circle_fill,
                    color: Colors.pink,
                    size: 50,
                  ),
                  onPressed: togglePlayPause,
                ),
                IconButton(
                  icon: Icon(
                    Icons.skip_next_rounded,
                    color: Colors.grey,
                    size: 50,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(isShuffleOn
                      ? CupertinoIcons.shuffle
                      : Icons.shuffle_on_rounded),
                  onPressed: toggleShuffle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _formatDuration(Duration(seconds: _currentTime.toInt())),
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: 300.0,
                  child: SliderTheme(
                    data: SliderThemeData(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 8.0),
                      trackHeight: 3.0,
                    ),
                    child: Slider(
                      thumbColor: Color.fromARGB(255, 236, 61, 175),
                      activeColor: Color.fromARGB(255, 236, 61, 175),
                      inactiveColor: Color.fromARGB(255, 209, 98, 183),
                      value: _currentTime,
                      min: 0,
                      max: _totalDuration,
                      onChanged: (value) {
                        setState(() {
                          _currentTime = value;
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  _formatDuration(Duration(seconds: _totalDuration.toInt())),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.person_alt_circle_fill,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "Artist",
                      style: GoogleFonts.quintessential(
                        textStyle: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.gear_alt_fill,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "Settings",
                      style: GoogleFonts.quintessential(
                        textStyle: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.music_albums_fill,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "Libraary",
                      style: GoogleFonts.quintessential(
                        textStyle: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
