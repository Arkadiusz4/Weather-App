/*
{
 "queryCost": 1,
 "latitude": 49.92026,
 "longitude": 19.93024,
 "resolvedAddress": "Olszowice, Świątniki Górne, Woj. Małopolskie, Polska",
 "address": "Olszowice",
 "timezone": "Europe/Warsaw",
 "tzoffset": 2,
 "description": "Similar temperatures continuing with a chance of rain tomorrow & Tuesday & a chance of snow Monday.",
 "days": [
  {
   "datetime": "2022-04-15",
   "datetimeEpoch": 1649973600,
   "tempmax": 13.6,
   "tempmin": 8.6,
   "temp": 10.8,
   "feelslikemax": 13.6,
   "feelslikemin": 6.2,
   "feelslike": 10.4,
   "dew": 7.5,
   "humidity": 80.5,
   "precip": 7.3,
   "precipprob": 100,
   "precipcover": null,
   "preciptype": [
    "rain"
   ],
   "snow": 0,
   "snowdepth": 0,
   "windgust": 33.1,
   "windspeed": 14.8,
   "winddir": 255.6,
   "pressure": 1018.7,
   "cloudcover": 91.1,
   "visibility": 13.9,
   "solarradiation": 124.3,
   "solarenergy": 10.9,
   "uvindex": 5,
   "severerisk": 10,
   "sunrise": "05:47:54",
   "sunriseEpoch": 1649994474,
   "sunset": "19:33:50",
   "sunsetEpoch": 1650044030,
   "moonphase": 0.49,
   "conditions": "Rain, Overcast",
   "description": "Cloudy skies throughout the day with rain.",
   "icon": "rain",
   "stations": [
    "EPKK",
    "E6527"
   ],
   "source": "comb",
   "hours": [
    {
     "datetime": "12:00:00",
     "datetimeEpoch": 1650016800,
     "temp": 11,
     "feelslike": 11,
     "humidity": 93.55,
     "dew": 10,
     "precip": 0,
     "precipprob": 0,
     "snow": 0,
     "snowdepth": 0,
     "preciptype": null,
     "windgust": 22.3,
     "windspeed": 11.2,
     "winddir": 240,
     "pressure": 1019,
     "visibility": 6,
     "cloudcover": 88,
     "solarradiation": 419,
     "solarenergy": 1.5,
     "uvindex": 4,
     "severerisk": 10,
     "conditions": "Partially cloudy",
     "icon": "partly-cloudy-day",
     "stations": [
      "EPKK",
      "E6527"
     ],
     "source": "obs"
    },
    {
     "datetime": "13:00:00",
     "datetimeEpoch": 1650020400,
     "temp": 11.8,
     "feelslike": 11.8,
     "humidity": 81.85,
     "dew": 8.8,
     "precip": 0.1,
     "precipprob": 100,
     "snow": 0,
     "snowdepth": 0,
     "preciptype": [
      "rain"
     ],
     "windgust": 28.1,
     "windspeed": 13.3,
     "winddir": 301.4,
     "pressure": 1020,
     "visibility": 24.1,
     "cloudcover": 100,
     "solarradiation": 133,
     "solarenergy": 0.5,
     "uvindex": 1,
     "severerisk": 10,
     "conditions": "Rain, Overcast",
     "icon": "rain",
     "stations": [
      "remote"
     ],
     "source": "obs"
    }
   ]
  }
 ],
 "alerts": [],
 "stations": {
  "EPKK": {
   "distance": 20076,
   "latitude": 50.08,
   "longitude": 19.8,
   "useCount": 0,
   "id": "EPKK",
   "name": "EPKK",
   "quality": 50,
   "contribution": 0
  },
  "E6527": {
   "distance": 25912,
   "latitude": 50.153,
   "longitude": 19.955,
   "useCount": 0,
   "id": "E6527",
   "name": "EW6527 Krakow PL",
   "quality": 0,
   "contribution": 0
  },
  "EPKT": {
   "distance": 86620,
   "latitude": 50.47,
   "longitude": 19.07,
   "useCount": 0,
   "id": "EPKT",
   "name": "EPKT",
   "quality": 50,
   "contribution": 0
  },
  "LZTT": {
   "distance": 97433,
   "latitude": 49.07,
   "longitude": 20.25,
   "useCount": 0,
   "id": "LZTT",
   "name": "LZTT",
   "quality": 50,
   "contribution": 0
  }
 },
 "currentConditions": {
  "datetime": "13:30:00",
  "datetimeEpoch": 1650022200,
  "temp": 12.9,
  "feelslike": 12.9,
  "humidity": 80.8,
  "dew": 9.7,
  "precip": 0.2,
  "precipprob": null,
  "snow": 0,
  "snowdepth": 0,
  "preciptype": null,
  "windgust": null,
  "windspeed": 9.5,
  "winddir": 245,
  "pressure": 1019,
  "visibility": 10,
  "cloudcover": 86.5,
  "solarradiation": 543,
  "solarenergy": 2,
  "uvindex": 5,
  "conditions": "Rain, Partially cloudy",
  "icon": "rain",
  "stations": [
   "EPKT",
   "EPKK",
   "LZTT"
  ],
  "sunrise": "05:47:54",
  "sunriseEpoch": 1649994474,
  "sunset": "19:33:50",
  "sunsetEpoch": 1650044030,
  "moonphase": 0.49
 }
}

  https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Olszowice?unitGroup=metric&key=QVDLJFCCQRM5296M7J975FP2W&contentType=json
*/

class WeatherResponseOnecall {
  final String city;

  WeatherResponseOnecall({
    required this.city,
  });

  factory WeatherResponseOnecall.fromJson(Map<String, dynamic> json) {
    final city = json['address'];

    return WeatherResponseOnecall(city: city);
  }
}
