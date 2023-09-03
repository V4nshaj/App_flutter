import 'package:bitcoin/coiner.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io'
    show
        Platform; //show means it will incorporate only specific file inside the library if hide "plaform" it will show all the files library except hidden

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'INR';
  DropdownButton<String> AndroidDropdown() {
    //declaring str5ing as it requires to declare for string inputs
    List<DropdownMenuItem<String>> dropdownitem = [];
    for (String i in currenciesList) {
      var newitem = DropdownMenuItem(
        child: Text(i),
        value: i,
      );
      dropdownitem.add(newitem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownitem,
      onChanged: (value) {
        //to update use set state
        setState(
          () {
            selectedCurrency =
                value!; //string? means can be null so use ! at last
          },
        );
      },
    );
  }

  CupertinoPicker IOSpicker() {
    List<Text> pickeritem = [];
    for (String i in currenciesList) {
      pickeritem.add(
        Text(i),
      );
    }

    return CupertinoPicker(
      // backgroundColor: Color.lightBlue
      itemExtent: 32.0, //size of the cupertino
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickeritem,
    );
  }

  // Widget getPicker() {
  //   if (Platform.isIOS) {
  //     return IOSpicker();
  //   }
  //   return AndroidDropdown();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Coin(selectedCurrency, cryptoList[0])),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Coin(selectedCurrency, cryptoList[1])),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Coin(selectedCurrency, cryptoList[2])),
            ],
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              /*cupertino is used as replacement for dropdown bar*/
              child: Platform.isIOS ? IOSpicker() : AndroidDropdown()),
        ],
      ),
    );
  }
}
