/*
{
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 16093,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },
  "clouds": {
    "all": 1
  },
  "dt": 1560350645,
  "sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
  }                  

*/

class WeatherInfo {
  final String description, icon;
  final int id;

  WeatherInfo(
      {required this.description, required this.icon, required this.id});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    final id = json['id'];
    return WeatherInfo(description: description, icon: icon, id: id);
  }
}

class WindInfo {
  final double windInfo;

  WindInfo({required this.windInfo});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final windInfo = json['speed'];
    return WindInfo(windInfo: windInfo);
  }
}

class HumidityInfo {
  final int humidity;

  HumidityInfo({required this.humidity});

  factory HumidityInfo.fromJson(Map<String, dynamic> json) {
    final humidity = json['humidity'];
    return HumidityInfo(humidity: humidity);
  }
}

class CloudsInfo {
  final int clouds;

  CloudsInfo({required this.clouds});

  factory CloudsInfo.fromJson(Map<String, dynamic> json) {
    final clouds = json['all'];
    return CloudsInfo(clouds: clouds);
  }
}

class PressureInfo {
  final int pressure;

  PressureInfo({required this.pressure});

  factory PressureInfo.fromJson(Map<String, dynamic> json) {
    final pressure = json['pressure'];
    return PressureInfo(pressure: pressure);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class TemperatureFeelsLikeInfo {
  final double feelsLike;

  TemperatureFeelsLikeInfo({required this.feelsLike});

  factory TemperatureFeelsLikeInfo.fromJson(Map<String, dynamic> json) {
    final feelsLike = json['feels_like'];
    return TemperatureFeelsLikeInfo(feelsLike: feelsLike);
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo temperatureInfo;
  final WeatherInfo weatherInfo;
  final PressureInfo pressureInfo;
  final HumidityInfo humidityInfo;
  final CloudsInfo cloudsInfo;
  final TemperatureFeelsLikeInfo feelsLikeInfo;
  final WindInfo windInfo;

//https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png
  String get iconUrl {
    if (weatherInfo.id >= 200 && weatherInfo.id < 300) {
      return 'assets/icons/thunderstorm.png';
    } else if (weatherInfo.id >= 300 && weatherInfo.id < 500) {
      return 'assets/icons/drizzle.png';
    } else if (weatherInfo.id >= 500 && weatherInfo.id < 600) {
      return 'assets/icons/heavy-rain.png';
    } else if (weatherInfo.id >= 600 && weatherInfo.id < 700) {
      return 'assets/icons/snowfall.png';
    } else if (weatherInfo.id >= 700 && weatherInfo.id < 800) {
      return 'assets/icons/fog.png';
    } else if (weatherInfo.id == 800) {
      return 'assets/icons/sun.png';
    } else if (weatherInfo.id == 801) {
      return 'assets/icons/cloud.png';
    } else if (weatherInfo.id == 802) {
      return 'assets/icons/cloud.png';
    } else if (weatherInfo.id == 803) {
      return 'assets/icons/overcast_cloud.png';
    } else if (weatherInfo.id == 804) {
      return 'assets/icons/overcast_cloud.png';
    } else {
      return '';
    }
  }

  String get backgroundImage {
    if (weatherInfo.id >= 200 && weatherInfo.id < 300) {
      return 'assets/images/thunderstorm.jpg';
    } else if (weatherInfo.id >= 300 && weatherInfo.id < 500) {
      return 'assets/images/drizzle.jpg';
    } else if (weatherInfo.id >= 500 && weatherInfo.id < 600) {
      return 'assets/images/rain.jpg';
    } else if (weatherInfo.id >= 600 && weatherInfo.id < 700) {
      return 'assets/images/snow.jpg';
    } else if (weatherInfo.id >= 700 && weatherInfo.id < 800) {
      return 'assets/images/fog.jpg';
    } else if (weatherInfo.id == 800) {
      return 'assets/images/clear_sky.jpg';
    } else if (weatherInfo.id == 801) {
      return 'assets/images/few_clouds.jpg';
    } else if (weatherInfo.id == 802) {
      return 'assets/images/scattered_clouds.jpg';
    } else if (weatherInfo.id == 803) {
      return 'assets/images/broken_clouds.jpg';
    } else if (weatherInfo.id == 804) {
      return 'assets/images/overcast_clouds.jpg';
    } else {
      return 'assets/images/normal.jpg';
    }
  }

  WeatherResponse({
    required this.cityName,
    required this.temperatureInfo,
    required this.weatherInfo,
    required this.pressureInfo,
    required this.humidityInfo,
    required this.cloudsInfo,
    required this.feelsLikeInfo,
    required this.windInfo,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final temperatureInfoJson = json['main'];
    final temperatureInfo = TemperatureInfo.fromJson(temperatureInfoJson);

    final feelsLikeInfoJson = json['main'];
    final feelsLikeInfo = TemperatureFeelsLikeInfo.fromJson(feelsLikeInfoJson);

    final pressureInfoJson = json['main'];
    final pressureInfo = PressureInfo.fromJson(pressureInfoJson);

    final humidityInfoJson = json['main'];
    final humidityInfo = HumidityInfo.fromJson(humidityInfoJson);

    final cloudsInfoJson = json['clouds'];
    final cloudsInfo = CloudsInfo.fromJson(cloudsInfoJson);

    final windInfoJson = json['wind'];
    final windInfo = WindInfo.fromJson(windInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(
      cityName: cityName,
      temperatureInfo: temperatureInfo,
      weatherInfo: weatherInfo,
      pressureInfo: pressureInfo,
      humidityInfo: humidityInfo,
      cloudsInfo: cloudsInfo,
      feelsLikeInfo: feelsLikeInfo,
      windInfo: windInfo,
    );
  }
}
