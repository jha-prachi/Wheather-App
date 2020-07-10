import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apikey = 'a8d75183b85478dff0b4ebd264e804ab';
const url = 'https://api.openweathermap.org/data/2.5/weather';
double latitude;
double longitude;

class WeatherModel {
  Future<dynamic> getlocationweather() async {
    Location mylocation = Location();
    await mylocation.getCurrentLocation();
    latitude = mylocation.latitude;
    longitude = mylocation.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        '$url?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');

    var wheatherdata = await networkHelper.getData();
    return wheatherdata;
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
