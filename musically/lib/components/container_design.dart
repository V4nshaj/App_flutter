import 'package:flutter/material.dart';
import 'package:musically/components/text_design.dart';

Container popular_container(String tdef, String tdes, String iloc) {
  return Container(
    height: 110.0,
    width: 70.0,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey, // Border color
        width: 1.0, // Border width
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        img_container(iloc),
        SizedBox(
          height: 10.0,
        ),
        text_def(tdef),
        SizedBox(
          height: 5.0,
        ),
        text_des(tdes),
      ],
    ),
  );
}

Row News_container(String tdef, String tdes, String iloc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      img_container(iloc),
      // SizedBox(
      //   width: 5.0,
      // ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text_def(tdef),
          text_des(tdes),
        ],
      ),

      learn_text()
    ],
  );
}

Container famous_container(String tdef, String iloc) {
  return Container(
    height: 90.0,
    width: 70.0,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey, // Border color
        width: 1.0, // Border width
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        img_container(iloc),
        SizedBox(
          height: 10.0,
        ),
        text_def(tdef),
      ],
    ),
  );
}

Container img_container(String img_loc) {
  return Container(
    height: 50.0,
    width: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: Image.asset(img_loc),
  );
}
