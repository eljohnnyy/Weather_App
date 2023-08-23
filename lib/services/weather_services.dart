import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fristproject/pages/models/weather_model.dart';
import 'package:http/http.dart' as http;

class Weatherservices {
    WeatherModel? weather;
 Future<WeatherModel?> getweather({required String CityName}) async {
  try{  String baseurl = 'http://api.weatherapi.com/v1';
    String apikey = '4f98c89da53447519c9212035231607';
    Uri url =
        Uri.parse('$baseurl/forecast.json?key=$apikey&q=$CityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

     weather = WeatherModel.fromjson(data);}catch(e){
      print(e);
    }
        
        return weather;
  }
}
