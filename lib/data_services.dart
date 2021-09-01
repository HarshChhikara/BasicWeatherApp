import 'package:http/http.dart'as http;
import 'package:simpleweatherapp/models.dart';
import 'dart:convert';

class DataService{
  Future<WeatherResponse> getWeather(String city) async {
     //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid' : 'ed1d0ae90c60791963eb0612fd5340ed',
      'units' : "metric"

    };

    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);


    print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}