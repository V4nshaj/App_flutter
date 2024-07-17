import 'package:flutter/material.dart';
import 'package:shopazon/widgets/text_field.dart';

class SigninScreen extends StatelessWidget {
  static const String id = "signin_screen";

  //text controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.lock,
                size: 100.0,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16.0),
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(
                height: 10.0,
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
