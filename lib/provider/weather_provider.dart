import 'package:flutter/widgets.dart';


import '../pages/models/weather_model.dart';

class weatherprovider extends ChangeNotifier{
  WeatherModel? _weatherdata;
  String? cityname;
  set weatherdata(WeatherModel? weather){
    _weatherdata=weather;
    notifyListeners();
  }
  WeatherModel? get weatherdata=>_weatherdata;
}