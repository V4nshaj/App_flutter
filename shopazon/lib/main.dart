import 'package:flutter/material.dart';
import 'screens/signin_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        initialRoute: SigninScreen.id,
        routes: {
          SigninScreen.id: (context) => SigninScreen(),
          SplashScreen.id: (context) => SplashScreen(),
          // HomeScreen.id: (context) => HomeScreen(),
        });
  }
}
