import 'package:clima/screens/location_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

// const apikey = 'a8d75183b85478dff0b4ebd264e804ab';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  //if we want something to happen the moment that our stateful widget is created and
  // add into the tree, then we're going to put our code inside initState.
  //If we want something to happen every single time
  //only created at once
  void initState() {
    super.initState();
    getlocationData();
  }

  //getter
  void getlocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherdata=await weatherModel.getlocationweather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherdata,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white54,
          size: 100.0,
        ),
      ),
    );
  }
}

//response.statusCode
//(body)same data milega jo mujhe browser par mila tha

// if we want something to happen when our stateful widget gets destroyed, then we would put
// the code inside the deactivate method.
// @override
// void deactivate() {
//   super.deactivate();
//   print('deactivated');
// }

//first key is going to be the string coord,acess through []
//I'm going to add another set of square brackets and add the word lon,
// var abc = json.decode(data)['coord']['lon'];
//       print(abc);
//       var res = json.decode(data)['weather']['0']['main'];
//       print(res);
