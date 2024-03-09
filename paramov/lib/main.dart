import 'package:paramov/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paramov/screens/startup_screen.dart';
import 'package:paramov/screens/welcome_screen.dart';
import 'package:paramov/screens/registration_screen.dart';
import 'package:paramov/screens/login_screen.dart';
import 'package:paramov/screens/vital_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //some platform integration features may not be available until the binding has been initialized.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Paramov());
}

class Paramov extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //welcomeScreen.id associate with Welcomescreen as string name can be misspelled but id never changes
      initialRoute: LoginScreen
          .id, //initial route is defined as / bcz home is not consider if inital route is defined
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        StartupScreen.id: (context) => StartupScreen(),
        VitalScreen.id: (context) => VitalScreen(
              user: '',
            ),
      },
      // home: WelcomeScreen(), //for home page
    );
  }
}
