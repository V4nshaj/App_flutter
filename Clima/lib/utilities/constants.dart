import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 55.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 55.0,
);

const kInputDecoration = InputDecoration(
  filled: true,//fills the color in text field little white fade
  fillColor: Colors.white,//changes the color
  icon: Icon(Icons.location_city, color: Colors.white,
  ),
  hintText: 'Enter City Name',//default color is white
  hintStyle: TextStyle(//with hintstyle we can change clr
    color: Colors.grey,
  ),
  border: OutlineInputBorder( // provides border arnd textfield
    borderRadius: BorderRadius.all(Radius.circular(10.0),),
    borderSide: BorderSide.none,//removes the border line around textfield
  ),
);