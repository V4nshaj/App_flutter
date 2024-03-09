import 'package:flutter/material.dart';
import 'package:paramov/components/rounded_button.dart';
import 'package:paramov/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paramov/screens/vital_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:paramov/widget/purple_overlay.dart';

enum LoginState { Login, Register }

class RegistrationScreen extends StatefulWidget {
  static const String id = 'Registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  LoginState _currentState = LoginState.Login;
  String _email = "";
  String _password = "";

  void toggleState() {
    setState(() {
      _currentState = _currentState == LoginState.Login
          ? LoginState.Register
          : LoginState.Login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentState == LoginState.Login ? 'Login' : 'Register'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Background image
                  // Tilted purple overlay
                  Purple_overlay(),
                  Center(
                    child: Image.asset(
                      'images/logo.jpg', // Replace with your image path
                      width: MediaQuery.of(context).size.width *
                          0.3, // 80% of screen width
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                ],
              ),
              // Email field
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add email validation logic (optional)
                  return null;
                },
                onSaved: (newValue) => _email = newValue!,
              ),
              SizedBox(height: 10.0),

              // Password field
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true, // Hide password characters
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (newValue) => _password = newValue!,
              ),

              // Additional fields for registration (conditionally displayed)
              if (_currentState == LoginState.Register) SizedBox(height: 10.0),
              if (_currentState == LoginState.Register)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  // Add onSaved for name if needed
                ),

              SizedBox(height: 20.0),

              // Login/Register button based on current state
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle login or registration logic here (e.g., call API)
                    print(
                        '${_currentState == LoginState.Login ? 'Login' : 'Registration'} successful: Email: $_email, Password: $_password');
                  }
                },
                child: Text(
                  _currentState != LoginState.Login ? 'Register' : 'Login',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),

              // Toggle button to switch between Login and Register
              TextButton(
                onPressed: toggleState,
                child: Text(_currentState != LoginState.Login
                    ? 'Existing User? Login Here'
                    : 'New User? Register Here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
