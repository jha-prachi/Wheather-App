import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  //if we want something to happen the moment that our stateful widget is created and
  // add into the tree, then we're going to put our code inside initState.
  //If we want something to happen every single time
  //only created at once
  void initState() {
    super.initState();
    getlocation();
  }

  //getter
  void getlocation() async {
    Location mylocation = Location();
    await mylocation.getCurrentLocation();
    print(mylocation.latitude);
    print(mylocation.longitude);
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }

    //response.statusCode
    //(body)same data milega jo mujhe browser par mila tha
  }

  // if we want something to happen when our stateful widget gets destroyed, then we would put
  // the code inside the deactivate method.
  // @override
  // void deactivate() {
  //   super.deactivate();
  //   print('deactivated');
  // }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
