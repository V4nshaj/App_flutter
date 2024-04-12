import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:musically/components/notification_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musically/screens/login_screen.dart';
import 'package:musically/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //with SingleTickerProviderStateMixin helps welcome_screen is used for vysnc as a ticker for single animation
  //for multiple ticker we use TickerProviderStateMixin
  //custom animation
  AnimationController?
      controller; //? mark is for null safety i.e it can take null values

  late Animation animation; //to use curves i.e change the rate of ticker
  //late helps to tell the system we will initialize the variable
  //only use late if u initialized later else declare ? mark for null
  @override
  void initState() {
    //this is the first screen or state that executes
    super.initState();
    if (!kIsWeb) {
      NotificationController.initializeContext(context);
      NotificationController.startListeningNotificationEvents();
      NotificationController.requestFirebaseToken();
    }
    controller = AnimationController(
      duration: Duration(seconds: 5), //duration of the animation
      vsync: this, //vsync helps apply animation to specified state
      //this means this welcome_screen will provide the ticker
      // upperBound:100, //there upperbound and lower bound which changes the duration from 1 to 100
    );
    animation =
        ColorTween(begin: Colors.red, end: Colors.grey).animate(controller!);
    //ColorTween helps animate color change from redd to blue
    controller!
        .forward(); //means animation forward from 0,,0.1,..till menstion time in duration
    /*
    animation = CurvedAnimation(
        parent: controller!,
        curve: Curves
            .decelerate); //parent means what curve applied to and curve means type of curve applied
    //--> ! mark for tell the value for conttroller is not null
    
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller!.reverse(from: 1); //it goes from 1 to 0
      } else if (status == AnimationStatus.dismissed) {
        controller!.forward();
      }
    }); //to check if the AniumationStatus.completed for forward and AniumationStatus.dismissed for reverse
    */

    controller!.addListener(
      () {
        setState(() {});
        //helps to get the controller value
        // print(controller!.value);
        // print(animation.value); //animation is layer top of the controller
        if (animation.value == Colors.grey) {
          Navigator.pushNamedAndRemoveUntil(
              context, RegistrationScreen.id, (Route<dynamic> route) => false);
        }
      },
    );
  }

  @override
  void dispose() {
    //always dispose the controller after changing the screen or it will consume the resources
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('images/image2.jpg'), // Replace with your image path
            fit: BoxFit.cover, // Adjust as needed (cover, contain, etc.)
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: DefaultTextStyle(
                  style: GoogleFonts.quintessential(
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      color: animation.value,
                    ),
                  ),
                  child: AnimatedTextKit(
                    // Use prepackaged 'TypewriterAnimatedText' for typewriting effect
                    animatedTexts: [
                      TypewriterAnimatedText(
                        // Customize the text displayed during animation
                        'Musically',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
