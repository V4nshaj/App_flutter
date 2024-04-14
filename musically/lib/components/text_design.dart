import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text text_des(String name) {
  return Text(
    name,
    style: GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: 7.0, fontWeight: FontWeight.w500),
    ),
  );
}

Text text_def(String name) {
  return Text(
    name,
    style: GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
    ),
  );
}

Text genre_text(String name) {
  return Text(
    name,
    style: GoogleFonts.openSans(
      textStyle: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: Colors.purpleAccent),
    ),
  );
}

Text more_text() {
  return Text(
    "More",
    style: GoogleFonts.openSans(
      textStyle: TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w400,
          color: Colors.purpleAccent),
    ),
  );
}

Text learn_text() {
  return Text(
    "Learn more",
    style: GoogleFonts.openSans(
      textStyle: TextStyle(
          fontSize: 8.0,
          fontWeight: FontWeight.w400,
          color: Colors.purpleAccent),
    ),
  );
}

Text heading2(String name) {
  return Text(
    name,
    style: GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
    ),
  );
}

Text Heading1(
  String hname,
) {
  return Text(
    hname,
    style: GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
    ),
  );
}

final String text = '';
Text bold_text({required boldtext}) {
  return Text(
    boldtext,
    style: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
    ),
    textAlign: TextAlign.left,
  );
}

final String lighttext = '';
Text light_text({required lighttext}) {
  return Text(
    lighttext,
    style: TextStyle(
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.w300,
    ),
    textAlign: TextAlign.center,
  );
}
