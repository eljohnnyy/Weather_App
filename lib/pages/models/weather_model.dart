import 'package:flutter/material.dart';

class WeatherModel {
 String date;
  double temp;
  double mintem;
  double maxtemp;
  String weatherstate;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.mintem,
      required this.maxtemp,
      required this.weatherstate});
  factory WeatherModel.fromjson(dynamic data) {
    var json = data['forecast']['forecastday'][0]['day'];
print('$json');
    return WeatherModel(
        date: data['location']['localtime'],
        temp: json['avgtemp_c'],
        mintem: json['mintemp_c'],
        maxtemp: json['maxtemp_c'],
        weatherstate: json['condition']['text']);
  }
  String getimage(){
if(weatherstate=='clear'||weatherstate=='Light Cloud'){
  return 'assets/images/clear.png';
}
else if(weatherstate=='Sleet'||weatherstate=='Snow'||weatherstate=='Hail'){
  return 'assets/images/snow.png';
}
else if(weatherstate=='Heavy Cloud'){
  return 'assets/images/Cloudy.png';
}
else if(weatherstate=='Light Rain'||weatherstate=='Heavy Rain'||weatherstate=='Showers'||weatherstate=='Patchy rain possible'){
  return 'assets/images/rainy.png';
}
else if(weatherstate=='Thunderstom'){
  return 'assets/images/thunderstorm.png';
}
else{
 return 'assets/images/clear.png';
}

  }
  MaterialColor getcolor(){
if(weatherstate=='Clear'||weatherstate=='Light Cloud'){
  return Colors.orange;
}
else if(weatherstate=='Sleet'||weatherstate=='Snow'||weatherstate=='Hail'){
  return Colors.blue;
}
else if(weatherstate=='Heavy Cloud'){
  return Colors.blueGrey;
}
else if(weatherstate=='Light Rain'||weatherstate=='Heavy Rain'||weatherstate=='Showers'||weatherstate=='Patchy rain possible'){
  return Colors.blue;
}
else if(weatherstate=='Thunderstom'){
  return Colors.green;
}
else{
 return Colors.orange;
}

  }
}
