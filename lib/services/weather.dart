import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/apikey.dart';

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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
