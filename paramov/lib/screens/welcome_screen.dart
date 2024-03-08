import 'package:paramov/screens/login_screen.dart';
import 'package:paramov/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:paramov/components/rounded_button.dart';
import 'package:paramov/widget/add_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get Instant notification for Patients',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Paramov streams real-time patient health insights for abnormality detection and interventions.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25.0),
            Stack(
              children: [
                // Background image

                // Tilted purple overlay
                Transform(
                  alignment: Alignment.topLeft, // Adjust alignment for tilt
                  transform: Matrix4.skewY(
                      -0.4), // Adjust angle for tilt (negative for slight left tilt)
                  child: Container(
                    margin: EdgeInsets.only(top: 120.0),
                    color: Colors.purple
                        .withOpacity(0.1), // Set purple color with opacity
                    height: MediaQuery.of(context).size.height *
                        0.35, // Set medium height (50%)
                    width: double.infinity, // Set medium width (50%)
                  ),
                ),
                Center(
                  child: Image.asset(
                    'images/doc1.png', // Replace with your image path
                    width: MediaQuery.of(context).size.width *
                        0.8, // 80% of screen width
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0), // Add spacing between image and button
            add_button(),
          ],
        ),
      ),
    );
  }
}
