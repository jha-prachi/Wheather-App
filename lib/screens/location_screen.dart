import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temparture;
  String weatherIcon;
  String city;
  String weathermsg;
  @override
  void initState() {
    super.initState();
    UpdateUi(widget.locationWeather);
  }

  void UpdateUi(dynamic wheatherdata) {
    setState(() {
      // Here i Tackle if weatherdata is null due to some reason,my app will not crash
      if (wheatherdata == null) {
        temparture = 0;
        weatherIcon = 'Error';
        weathermsg = 'Unable to load the Data';
        city = '';
        return;
      }
      double abc = wheatherdata['main']['temp'];
      temparture = abc.toInt();
      var id = wheatherdata['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(id);
      weathermsg = weather.getMessage(temparture);
      city = wheatherdata['name'];
      print(temparture);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherdata = await weather.getlocationweather();
                      UpdateUi(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // builder expects a callback inside return what ever you want to
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedName != null) {
                       
                             var weatherData = await weather.getCityWeather(typedName);
                        UpdateUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temparture°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weathermsg in $city!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
