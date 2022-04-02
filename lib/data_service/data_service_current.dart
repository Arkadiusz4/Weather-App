import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/models_current.dart';

class DataServiceCurrent {
  Future<WeatherResponseCurrent> getWeather(String city) async {
    //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '90e1be249ed1e3190e4f7148d7f8c811',
      'exclude': 'hourly',
      'units': 'metric',
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponseCurrent.fromJson(json);
  }
}
