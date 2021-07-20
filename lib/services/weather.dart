import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '4f2e75839742e81215cbdbd36239a3bc';
const String domain = 'api.openweathermap.org';
const String path = '/data/2.5/weather';

class WeatherModel {
  Future getCityWeather(String city) async {
    Map<String, dynamic> param = {
      'q': city,
      'appid': apiKey,
      'units': 'metric'
    };
    NetworkHelper networkHelper = NetworkHelper(domain, path, param);
    var decodedData = await networkHelper.getData();
    return decodedData;
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, dynamic> param = {
      'lat': '${location.latitude}',
      'lon': '${location.longitude}',
      'appid': apiKey,
      'units': 'metric'
    };
    NetworkHelper networkHelper = NetworkHelper(domain, path, param);
    var decodedData = await networkHelper.getData();
    return decodedData;
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
