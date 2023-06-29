import 'package:http/http.dart' as http;
//adding http helps to recognise it came from package
import 'dart:convert';
class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future getData() async{

    http.Response response = await http.get(Uri.parse(url));
    //get method creates future response so to hld the data we use Response
    // print(response.body); //response.body is in http package used to get all details
    if (response.statusCode == 200) {
      String data = response.body;
      /*print(data);
      var longitude = jsonDecode(data)['coord']['lon'];
      json format decode and print
      print(longitude);
      var weatherDesc = jsonDecode(data)['weather'][0]['description'];
      as under weather there is no index its 0 uder 0 its desc
      print(weatherDesc);*/
      var decodeData = jsonDecode(data);
      return decodeData;
      }
    else {
      print(response.statusCode); //it states the code that is weather its successful or not 200 for success
    }
  }
}