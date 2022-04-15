import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data_service/data_service_current.dart';
import 'package:weather_app/data_service/data_service_onecall.dart';
import 'package:weather_app/models/models_current.dart';
import 'package:weather_app/models/models_onecall.dart';
import 'package:weather_app/providers/connectivity_provider.dart';
import 'package:weather_app/widgets/no_internet.dart';
import 'package:sizer/sizer.dart';

import 'package:weather_app/widgets/weather_card.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _cityTextController = TextEditingController();
  final _dataServiceCurrent = DataServiceCurrent();
  final _dataServiceOneCall = DataServiceOneCall();

  WeatherResponseCurrent? _responseCurrent;
  WeatherResponseOnecall? _responseOnecall;

  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(this.context, listen: false)
        .startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageUI(),
    );
  }

  Widget pageUI() {
    return Consumer<ConnectivityProvider>(
      builder: (context, model, child) {
        if (model.isOnline != null) {
          return model.isOnline ? HomeScreen(context) : NoInternet();
        }

        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget HomeScreen(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  (_responseCurrent != null)
                      ? _responseCurrent!.backgroundImage
                      : 'assets/images/normal.jpg',
                ),
                fit: BoxFit.fitHeight,
                colorFilter: (_responseCurrent != null)
                    ? ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken)
                    : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.w,
                    right: 5.w,
                    top: 3.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.w),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: TextField(
                              controller: _cityTextController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search for a city...',
                                suffixIcon: _cityTextController.text.length > 0
                                    ? null
                                    : IconButton(
                                        onPressed: () =>
                                            _cityTextController.clear(),
                                        icon: Icon(
                                          Icons.clear,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: _search,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_responseCurrent != null)
                  (_responseCurrent?.cod != 404)
                      ? Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(top: 100),
                            child: Column(
                              children: [
                                Text(
                                  '${_responseCurrent?.temperatureInfo.temperature.round()} °C',
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 80,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                Image.asset(_responseCurrent!.iconUrl,
                                    color: Colors.white, height: 80),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${_responseCurrent?.weatherInfo.description.toUpperCase()}',
                                  style: GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 20),
                                          child: Container(
                                            width: 100,
                                            height: 2.5,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            '${_responseCurrent?.cityName}',
                                            style: GoogleFonts.lato(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 40, left: 15, right: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              WeatherCard(
                                                  text: 'Humidity',
                                                  subtext:
                                                      '${_responseCurrent?.humidityInfo.humidity}%',
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          3 -
                                                      30,
                                                  image:
                                                      'assets/images/humidity.png'),
                                              WeatherCard(
                                                  text: 'Clouds',
                                                  subtext:
                                                      '${_responseCurrent?.cloudsInfo.clouds}%',
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          3 -
                                                      30,
                                                  image:
                                                      'assets/images/clouds.png'),
                                              WeatherCard(
                                                  text: 'Pressure',
                                                  subtext:
                                                      '${_responseCurrent?.pressureInfo.pressure} hPa',
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          3 -
                                                      30,
                                                  image:
                                                      'assets/images/pressure.png'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 40, left: 15, right: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              WeatherCard(
                                                  text: 'Perceived temperature',
                                                  subtext:
                                                      '${_responseCurrent?.feelsLikeInfo.feelsLike.round()} °C',
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      30,
                                                  image:
                                                      'assets/images/temperature.jpg'),
                                              WeatherCard(
                                                  text: 'Wind',
                                                  subtext:
                                                      '${_responseCurrent?.windInfo.windInfo} km/h',
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      30,
                                                  image:
                                                      'assets/images/wind.jpg'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          color: Colors.amber,
                        ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _search() async {
    final responseCurrent =
        await _dataServiceCurrent.getWeather(_cityTextController.text);

    final responseOneCall =
        await _dataServiceOneCall.getWeatherOneCall(_cityTextController.text);
    setState(() {
      _responseCurrent = responseCurrent;
      _responseOnecall = responseOneCall;
    });
  }
}
