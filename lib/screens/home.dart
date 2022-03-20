import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models.dart';
import 'package:weather_app/widgets/weather_card.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  (_response != null)
                      ? _response!.backgroundImage
                      : 'assets/images/normal.jpg',
                ),
                fit: BoxFit.fitHeight,
                colorFilter: (_response != null)
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
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
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
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                if (_response != null)
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 100),
                      child: Column(
                        children: [
                          Text(
                            '${_response?.temperatureInfo.temperature.round()} °C',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Image.asset(_response!.iconUrl, color: Colors.white, height: 80),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${_response?.weatherInfo.description.toUpperCase()}',
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
                                    MediaQuery.of(context).size.height * 0.9,
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
                                      '${_response?.cityName}',
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
                                            subtext: '${_response?.humidityInfo.humidity}%',
                                            width: MediaQuery.of(context).size.width / 3 - 30,
                                            image: 'assets/images/humidity.png'),
                                       WeatherCard(
                                            text: 'Clouds',
                                            subtext: '${_response?.cloudsInfo.clouds}%',
                                            width: MediaQuery.of(context).size.width / 3 - 30,
                                            image: 'assets/images/clouds.png'),
                                        WeatherCard(
                                            text: 'Pressure',
                                            subtext: '${_response?.pressureInfo.pressure} hPa',
                                            width: MediaQuery.of(context).size.width / 3 - 30,
                                            image: 'assets/images/pressure.png'),
                                      ],
                                    ),
                                    
                                  ),
                                  SizedBox(height: 40,),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 40, left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        WeatherCard(
                                            text: 'Perceived temperature',
                                            subtext: '${_response?.feelsLikeInfo.feelsLike.round()} °C',
                                            width: MediaQuery.of(context).size.width / 2 - 30,
                                            image: 'assets/images/temperature.jpg'),
                                       WeatherCard(
                                            text: 'Wind',
                                            subtext: '${_response?.windInfo.windInfo} km/h',
                                            width: MediaQuery.of(context).size.width / 2 - 30,
                                            image: 'assets/images/clouds.png'),
                                        
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
