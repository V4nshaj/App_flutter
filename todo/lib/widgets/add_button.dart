import 'package:flutter/material.dart';

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
        width: MediaQuery.of(context).size.width * 0.8, //screen size 80 % width
        padding: EdgeInsets.symmetric(vertical: 20.0),
        color: Colors.lightBlueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
