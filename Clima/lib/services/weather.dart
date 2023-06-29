import '../services/location.dart';
import '../services/networking.dart';

const apiKey = 'b07eedea286a930c0006878cce70a353';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic>  getCityWeather(String cityName) async{
    var url = '$openWeatherURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async //dynamic as dnt know about the data type
  {
    double latitude;
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    NetworkHelper networkHelper = NetworkHelper('$openWeatherURL?lat=$latitude&lon=${location.longitude}&appid=$apiKey&units=metric');//the url is obtained from openweather units=metric converts it into celcius
    /*
    var longitude = jsonDecode(data)['coord']['lon'];
    json format decode and print
    print(longitude);
    var weatherDesc = jsonDecode(data)['weather'][0]['description'];
    as under weather there is no index its 0 uder 0 its desc
    print(weatherDesc);*/

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
