import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class add_button extends StatelessWidget {
  const add_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //creates clickable areas i.e increases to touch area
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: MediaQuery.of(context).size.width * 0.8, //screen size 80 % width
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get Started',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
