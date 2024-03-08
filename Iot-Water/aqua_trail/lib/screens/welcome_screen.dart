import 'package:aqua_trail/screens/login_screen.dart';
import 'package:aqua_trail/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aqua_trail/components/rounded_button';

class WelcomeScreen extends StatefulWidget {
  //static helps to avoid creating object and directly access the variable or fuction
  static const String id = 'welcome_screen';
/*
class Circle
{
  static const double pi=3.141; it declared static as every object created from the circle class will same value for pi
}
 */
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
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
    controller = AnimationController(
      duration: Duration(seconds: 3), //duration of the animation
      vsync: this, //vsync helps apply animation to specified state
      //this means this welcome_screen will provide the ticker
      // upperBound:100, //there upperbound and lower bound which changes the duration from 1 to 100
    );
    animation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller!);
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
        print(animation.value); //animation is layer top of the controller
      },
    );
  }

  @override
  void dispose() {
    //always dispose the controller after changing the screen or it will consume the resources
    controller!.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      /*backgroundColor: Colors.red.withOpacity(controller!
          .value), //withopacity takes value from 0-1 so with controller value moving from 0,0.1,..1 thus changing frrom transparent to color
      //but it will not change we need to call setstate to rebuild the screen
      */
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  //hero widget helps to provide animation
                  tag: 'logo', //it is the starting tag for animation
                  child: Container(
                      child: Image.asset('images/logo.png'),
                      height:
                          // controller!.value, //height of logo changes frrom 0-100
                          controller!.value *
                              50 // value can be only from 0 to 1
                      ),
                ),
                SizedBox(
                  width: 240.0,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey[700],
                    ),
                    child: AnimatedTextKit(
                      //prepackage animated text type typewrite
                      // '${controller!.value.toInt()}%', //0-100%% using ticker value
                      animatedTexts: [TypewriterAnimatedText('Aqua-trail')],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              text: 'Log in',
              colored: Colors.lightBlueAccent,
              onPressed: () {
                //Go to login screen.
                Navigator.popAndPushNamed(
                    context,
                    LoginScreen
                        .id); //popAndPushNamed helps to remove or pops all the screen and only enables to push the screen
              },
            ),
            RoundedButton(
                text: 'Register',
                colored: Colors.blueAccent,
                onPressed: () {
                  //Go to registration screen.
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
