import 'package:flutter/foundation.dart';
import 'package:musically/components/notification_service.dart';
import 'package:musically/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musically/screens/music_screen.dart';
import 'package:musically/screens/startup_screen.dart';
import 'package:musically/screens/splash_screen.dart';
import 'package:musically/screens/registration_screen.dart';
import 'package:musically/screens/login_screen.dart';
import 'package:musically/screens/vital_screen.dart';
import 'package:musically/screens/music_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //some platform integration features may not be available until the binding has been initialized.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (!kIsWeb) {
    //for website
    await NotificationController.initializeLocalNotifications();
    await NotificationController.initializeRemoteNotifications(debug: true);
    await NotificationController.getInitialNotificationAction();
  }
  runApp(Musically());
}

class Musically extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(); //keys passed are global
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey:
          navigatorKey, //if in no screen then it helps in navigation getting context if out stateful widget
      debugShowCheckedModeBanner: false,
      //SplashScreen.id associate with Splashscreen as string name can be misspelled but id never changes
      initialRoute: MusicScreen
          .id, //initial route is defined as / bcz home is not consider if inital route is defined
      routes: {
        MusicScreen.id: (context) => MusicScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        StartupScreen.id: (context) => StartupScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        VitalScreen.id: (context) => VitalScreen(
              user: '',
            ),
      },
      // home: SplashScreen(), //for home page
    );
  }
}
