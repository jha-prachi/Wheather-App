import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);

    
    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      //var is dealing with dynamically everything and you can look at data and assign the datatypes
      var decodeddata = jsonDecode(data);
      return decodeddata;
    } else {
      print(response.statusCode);
    }
  }
}
