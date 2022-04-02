import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/models_onecall.dart';

class DataServiceOneCall {
  Future<WeatherResponseOnecall> getWeatherOneCall(String city) async {
    //https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '90e1be249ed1e3190e4f7148d7f8c811',
      'exclude': 'hourly',
      'units': 'metric',
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/onecall', queryParameters);

    final response_onecall = await http.get(uri);

    print(response_onecall.body);

    final json = jsonDecode(response_onecall.body);
    return WeatherResponseOnecall.fromJson(json);
  }
}
