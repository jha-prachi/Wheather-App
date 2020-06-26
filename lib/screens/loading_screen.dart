import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';


const apikey = 'a8d75183b85478dff0b4ebd264e804ab';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {  
  double latitude;
  double longitude;
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
    Location mylocation = Location();
    await mylocation.getCurrentLocation();
    latitude = mylocation.latitude;
    longitude = mylocation.longitude;
    NetworkHelper networkHelper=NetworkHelper(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey');


      var wheatherdata=await networkHelper.getData();


      // double abc = decodeddata['main']['temp'];
      // int id = decodeddata['weather']['0']['id'];
      // String city = decodeddata['name'];

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
    return Scaffold();
  }
}
//first key is going to be the string coord,acess through []
//I'm going to add another set of square brackets and add the word lon,
// var abc = json.decode(data)['coord']['lon'];
//       print(abc);
//       var res = json.decode(data)['weather']['0']['main'];
//       print(res);
