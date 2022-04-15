import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/models_onecall.dart';

class DataServiceOneCall {
  Future<WeatherResponseOnecall> getWeatherOneCall(String city) async {
    //https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Olszowice?unitGroup=metric&key=QVDLJFCCQRM5296M7J975FP2W&contentType=json

    final queryParameters = {
      'unitGroup': 'metric',
      'key': 'QVDLJFCCQRM5296M7J975FP2W',
      'contentType': 'json',
    };

    final uri = Uri.https(
        'weather.visualcrossing.com',
        '/VisualCrossingWebServices/rest/services/timeline/${city}?',
        queryParameters);

    final response_onecall = await http.get(uri);

    print(response_onecall.body);

    final json = jsonDecode(response_onecall.body);
    return WeatherResponseOnecall.fromJson(json);
  }
}
