import 'package:flutter/material.dart';
import 'dart:math';//math lib for random and other math calcul log e root etc
void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}
var a;/*dynamic datatype it can change from int top string but if var a = 10; or
value is provided at start the variable is not dynamic
string a;
dynamic a =12;
a='hlw'; can be changed with dynamic datatype
*/
class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // hotreload
  int leftDiceNumber =1;//variable for changing the dice number
  int rightDiceNumber =1;//if var outside so hot reload doesnt work

  void changeDice(){
    setState(() {//looks into the changes and rebuild the app
      leftDiceNumber = Random().nextInt(6)+1;//generates random no. from 0 to 6 so we add 1 as 0 doesnt exist
      print('Dice No.:  $leftDiceNumber ');
      rightDiceNumber = Random().nextInt(6)+1;
      print('Dice No.:  $rightDiceNumber ');
    });
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        children: [
          Expanded(
            // default flex set to 1 so same size
            // flex: 12,//takes size twice or 12 of 2nd dice
            // Padding(
            // padding: const EdgeInsets.all(16.0),//textbutton changes on touch
            child: TextButton(
              onPressed: (){//onpress always need to be defined what will do if pressed
                changeDice();
                print('Left Button got pressed');
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),//add variable with $ sign
            ),
          ), // same as Image(image:Assetimage('images/dice1.png'),
          Expanded(
            // flex: 5,//takes size of 1 or 12:5
            // Padding(
            // padding: const EdgeInsets.all(16.0),
            //textbutton provides default padding of 16.0
            child: TextButton(
              onPressed: (){//onpress always need to be defined what will do if pressed
                changeDice();
                print('Right Button got pressed');
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

//stateless widget doesnot allow changing of data but a stateful widget allows changing
/*
class DicePage extends StatelessWidget {

}*/
