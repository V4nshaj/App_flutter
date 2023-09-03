import 'package:flutter/material.dart';
import 'coin_data.dart';

FutureBuilder<dynamic> Coin(String selectedCurrency, String coin) {
  return FutureBuilder(
      //function gives time for ui to load
      future:
          CoinData.getRate(selectedCurrency, coin), //future ask for function
      builder: (context, snapshot) {
        //
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            {
              break;
            }
          case ConnectionState.done:
            {
              if (snapshot.hasData) {
                return Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child:
                        //checks whether the data is present
                        Text(
                      '1 $coin = ${(snapshot.data).toStringAsFixed(3)} $selectedCurrency', //future valu comes to snapshot.data
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }
              break;
            }
          case ConnectionState.waiting: //waiting for data
            {
              return CircularProgressIndicator();
            }
        }
        return Container(); //return anything dnt leave space it will show empty container if the code doesnt work
      });
}
