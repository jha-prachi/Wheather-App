import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

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
  void initState()  {
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
