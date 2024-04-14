import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:musically/components/notification_service.dart';
import 'package:musically/components/text_design.dart';
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
  bool _isPressed = false;

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
                    // color: Colors.grey,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 67.0,
                ),
                heading2("You're listening"),
                SizedBox(
                  width: 67.0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.pending_outlined,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heading2('Blinding Lights'),
                    SizedBox(height: 10.0),
                    light_text(lighttext: 'The Weeknd')
                  ],
                ),
                SizedBox(
                  width: 60.0,
                ),
                IconButton(
                  icon: Icon(
                    _isPressed ? Icons.favorite : Icons.favorite_border,
                    color: _isPressed ? Colors.red : null,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    color: Colors.grey.shade600,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    isPlaying
                        ? CupertinoIcons.pause_circle_fill
                        : CupertinoIcons.play_circle_fill,
                    color: Colors.purpleAccent,
                    size: 70,
                  ),
                  onPressed: togglePlayPause,
                ),
                IconButton(
                  icon: Icon(
                    Icons.skip_next_rounded,
                    color: Colors.grey.shade600,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(isShuffleOn
                      ? Icons.shuffle_on_rounded
                      : CupertinoIcons.shuffle),
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
                  width: 280.0,
                  child: SliderTheme(
                    data: SliderThemeData(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 8.0),
                      trackHeight: 3.0,
                    ),
                    child: Slider(
                      thumbColor: Colors.purpleAccent,
                      activeColor: Colors.purpleAccent,
                      inactiveColor: Colors.purpleAccent.shade100,
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
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.person_alt_circle_fill,
                        // color: Colors.grey.shade600,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    text_def('Artist')
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.gear_alt_fill,
                        // color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    text_def('Settings')
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.music_albums_fill,
                        // color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    text_def("Library")
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
